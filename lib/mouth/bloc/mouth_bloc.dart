// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:agent_repository/agent_repository.dart';
import 'package:carnal/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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

class MouthState extends Equatable {
  final List<WatcherItem> watchers;
  final List<MessageItem> messages;

  const MouthState({
    required this.watchers,
    required this.messages,
  });

  MouthState copyWith(
      {List<WatcherItem>? watchers, List<MessageItem>? messages}) {
    return MouthState(
      watchers: watchers ?? this.watchers,
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object?> get props => [messages];
}

abstract class MouthEvent extends Equatable {
  const MouthEvent();

  @override
  List<Object> get props => [];
}

class MessageAdded extends MouthEvent {
  const MessageAdded(this.message);

  final MessageItem message;

  @override
  List<Object> get props => [message];
}

class MouthBloc extends Bloc<MouthEvent, MouthState> {
  final AgentRepository _agentRepository;
  final ScrollController scrollController = ScrollController();
  final TextEditingController editingController = TextEditingController();
  final FocusNode keyboardFocusNode = FocusNode();
  late Timer _timer;

  MouthBloc({
    required AgentRepository agentRepository,
    required List<WatcherItem> watchers,
  })  : _agentRepository = agentRepository,
        super(MouthState(watchers: watchers, messages: const [])) {
    _timer = _toDayChangeTimer();
    on<MessageAdded>(_onMessageAdded);
  }

  Future<void> _onMessageAdded(
      MessageAdded event, Emitter<MouthState> emit) async {
    final messages = List<MessageItem>.from(state.messages);
    messages.add(event.message);
    emit(state.copyWith(messages: messages));
    final newMessages = List<MessageItem>.from(state.messages);
    final allowedPaths = state.watchers.map((watcher) => watcher.src).toList();
    final res =
        await _agentRepository.execute(event.message.message, allowedPaths);
    print("ai agent res: $res");
    newMessages.add(MessageItem(
        kind: UserKind.agent, message: res, dateTime: DateTime.now()));
    emit(state.copyWith(messages: newMessages));
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}

extension Helpers on MouthBloc {
  Timer _toDayChangeTimer() {
    final now = DateTime.now();
    final target = DateTime(now.year, now.month, now.day + 1);
    final duration = target.difference(now);
    return Timer(duration, () {
      // this.add(MouthDateTimeChanged(DateTime.now()));
      // this._timer.cancel();
      // this._timer = _toDayChangeTimer();
    });
  }
}
