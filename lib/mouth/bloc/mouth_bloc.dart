// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:carnal/utils/agent/agent.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:langchain/langchain.dart';

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
  final List<MessageItem> messages;

  const MouthState({
    required this.messages,
  });

  MouthState copyWith({List<MessageItem>? messages}) {
    return MouthState(
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
  final ScrollController scrollController = ScrollController();
  final TextEditingController editingController = TextEditingController();
  final FocusNode keyboardFocusNode = FocusNode();
  late Timer _timer;

  MouthBloc() : super(const MouthState(messages: [])) {
    _timer = _toDayChangeTimer();
    on<MessageAdded>(_onMessageAdded);
  }

  Future<void> _onMessageAdded(
      MessageAdded event, Emitter<MouthState> emit) async {
    final messages = List<MessageItem>.from(state.messages);
    messages.add(event.message);
    emit(state.copyWith(messages: messages));
    final newMessages = List<MessageItem>.from(state.messages);
    final executor = AgentExecutor(agent: agent);
    final res = await executor.run(event.message.message);
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
