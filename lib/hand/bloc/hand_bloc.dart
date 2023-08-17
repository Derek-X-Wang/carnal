// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';

class HandState extends Equatable {
  const HandState();

  HandState copyWith() {
    return HandState();
  }

  @override
  List<Object?> get props => [];
}

abstract class HandEvent extends Equatable {
  const HandEvent();

  @override
  List<Object> get props => [];
}

class HandBloc extends Bloc<HandEvent, HandState> {
  late Timer _timer;

  HandBloc() : super(const HandState()) {
    _timer = _toDayChangeTimer();
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}

extension Helpers on HandBloc {
  Timer _toDayChangeTimer() {
    final now = DateTime.now();
    final target = DateTime(now.year, now.month, now.day + 1);
    final duration = target.difference(now);
    return Timer(duration, () {
      // this.add(HandDateTimeChanged(DateTime.now()));
      // this._timer.cancel();
      // this._timer = _toDayChangeTimer();
    });
  }
}
