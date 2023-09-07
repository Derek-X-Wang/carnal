// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:agent_repository/agent_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/utils/platform_util.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:profiles_repository/profiles_repository.dart';
import 'package:window_manager/window_manager.dart';

enum UserKind {
  user,
  agent,
}

class MessageItem {
  final UserKind kind;
  final String message;
  final DateTime dateTime;

  const MessageItem({
    required this.kind,
    required this.message,
    required this.dateTime,
  });
}

class HomeState extends Equatable {
  final List<MessageItem> messages;
  final String messageInput;

  const HomeState({
    required this.messages,
    required this.messageInput,
  });

  HomeState copyWith({
    List<MessageItem>? messages,
    String? messageInput,
  }) {
    return HomeState(
      messages: messages ?? this.messages,
      messageInput: messageInput ?? this.messageInput,
    );
  }

  @override
  List<Object?> get props => [messages, messageInput];
}

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class MessageAdded extends HomeEvent {
  const MessageAdded(this.message);

  final MessageItem message;

  @override
  List<Object> get props => [message];
}

class HomeMessageInputChanged extends HomeEvent {
  const HomeMessageInputChanged(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

class HomeMessageSent extends HomeEvent {}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationRepository _authenticationRepository;
  final ProfilesRepository _profilesRepository;
  final AgentRepository _agentRepository;

  final FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  final TextEditingController editingController = TextEditingController();
  final FocusNode keyboardFocusNode = FocusNode();

  final GlobalKey _bannersViewKey = GlobalKey();
  final GlobalKey messagesViewKey = GlobalKey();
  final GlobalKey inputViewKey = GlobalKey();
  final GlobalKey _resultsViewKey = GlobalKey();
  Timer? _resizeTimer;

  void _onMessageInputChanged() =>
      add(HomeMessageInputChanged(editingController.text));

  HomeBloc({
    required AuthenticationRepository authenticationRepository,
    required ProfilesRepository profilesRepository,
    required AgentRepository agentRepository,
  })  : _profilesRepository = profilesRepository,
        _authenticationRepository = authenticationRepository,
        _agentRepository = agentRepository,
        super(const HomeState(messages: [], messageInput: "")) {
    on<HomeMessageInputChanged>(_mapMessageInputChanged);
    on<HomeMessageSent>(_onMessageSent);
    // Add listeners to the TextEditingControllers
    editingController.addListener(_onMessageInputChanged);
  }

  @override
  Future<void> close() {
    editingController.removeListener(_onMessageInputChanged);
    scrollController.dispose();
    editingController.dispose();
    return super.close();
  }
}

extension HomeEvents on HomeBloc {
  void _mapMessageInputChanged(
      HomeMessageInputChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(messageInput: event.text));
  }

  Future<void> _onMessageSent(
      HomeMessageSent event, Emitter<HomeState> emit) async {
    final messages = List<MessageItem>.from(state.messages);
    final messageInput = state.messageInput.trim();
    editingController.clear();
    messages.addAll([
      MessageItem(
          kind: UserKind.user, message: messageInput, dateTime: DateTime.now()),
      MessageItem(
          kind: UserKind.agent,
          message: "I'm thinking...",
          dateTime: DateTime.now()),
    ]);
    emit(state.copyWith(messages: messages, messageInput: ""));
    final messages2 = List<MessageItem>.from(state.messages);

    final user = _authenticationRepository.currentUser;
    final settings = await _profilesRepository.settings(user.id).first;
    final credentials = settings.credentials;
    if (credentials.openAiApiKey.isEmpty) {
      messages2.add(MessageItem(
          kind: UserKind.agent,
          message: "No ApiKey, pls go to Settings and save your ApiKey.",
          dateTime: DateTime.now()));
      emit(state.copyWith(messages: messages2));
    } else {
      final sources = _profilesRepository.currentContextSources(user.id);
      final allowedPaths = sources
          .expand<String>((e) => e.path != null ? [e.path!] : [])
          .toList();
      final res = await _agentRepository.execute(
          messageInput, allowedPaths, credentials.openAiApiKey);
      print("ai agent res: $res");
      messages2.add(MessageItem(
          kind: UserKind.agent, message: res, dateTime: DateTime.now()));
      emit(state.copyWith(messages: messages2));
    }
  }
}

extension Window on HomeBloc {
  void windowResize() {
    // if (Navigator.of(context).canPop()) return;

    if (_resizeTimer != null && _resizeTimer!.isActive) {
      _resizeTimer?.cancel();
    }
    _resizeTimer = Timer.periodic(const Duration(milliseconds: 10), (_) async {
      if (!kIsMacOS) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      RenderBox? rb1 =
          _bannersViewKey.currentContext?.findRenderObject() as RenderBox?;
      RenderBox? rb2 =
          inputViewKey.currentContext?.findRenderObject() as RenderBox?;
      RenderBox? rb3 =
          _resultsViewKey.currentContext?.findRenderObject() as RenderBox?;
      RenderBox? rb4 =
          messagesViewKey.currentContext?.findRenderObject() as RenderBox?;

      double toolbarViewHeight = 36.0;
      double bannersViewHeight = rb1?.size.height ?? 0;
      double inputViewHeight = rb2?.size.height ?? 0;
      double resultsViewHeight = rb3?.size.height ?? 0;
      double messagesViewHeight = rb4?.size.height ?? 0;

      const defaultMaxWindowHeight = 800.0;
      const defaultMaxWindowWidth = 400.0;
      try {
        // TODO: dynamic height, sometime has overflow issue. I think it because some height is not calculated yet and return 0
        double newWindowHeight = toolbarViewHeight +
            bannersViewHeight +
            inputViewHeight +
            resultsViewHeight +
            messagesViewHeight +
            (kIsWindows ? 5 : 0);
        // double newWindowHeight = 500.0;
        Size oldSize = await windowManager.getSize();
        Size newSize = Size(
          defaultMaxWindowWidth, //oldSize.width,
          newWindowHeight < defaultMaxWindowHeight
              ? newWindowHeight
              : defaultMaxWindowHeight,
        );
        if (oldSize.width != newSize.width ||
            oldSize.height != newSize.height) {
          await windowManager.setSize(newSize, animate: true);
        }
      } catch (error) {
        // print(error);
      }

      if (_resizeTimer != null) {
        _resizeTimer?.cancel();
        _resizeTimer = null;
      }
    });
  }
}
