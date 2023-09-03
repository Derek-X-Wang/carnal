// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';

class EyeState extends Equatable {
  const EyeState();

  EyeState copyWith() {
    return EyeState();
  }

  @override
  List<Object?> get props => [];
}

abstract class EyeEvent extends Equatable {
  const EyeEvent();

  @override
  List<Object> get props => [];
}

class EyeBloc extends Bloc<EyeEvent, EyeState> {
  late Timer _timer;

  EyeBloc() : super(const EyeState()) {
    _timer = _toDayChangeTimer();
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}

extension Helpers on EyeBloc {
  Timer _toDayChangeTimer() {
    final now = DateTime.now();
    final target = DateTime(now.year, now.month, now.day + 1);
    final duration = target.difference(now);
    return Timer(duration, () {
      // this.add(EyeDateTimeChanged(DateTime.now()));
      // this._timer.cancel();
      // this._timer = _toDayChangeTimer();
    });
  }
}
