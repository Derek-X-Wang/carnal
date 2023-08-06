// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';

class EyeState extends Equatable {
  final DateTime today;

  EyeState({
    required this.today,
  });

  EyeState copyWith({DateTime? today}) {
    return EyeState(
      today: today ?? this.today,
    );
  }

  @override
  List<Object?> get props => [today];
}

abstract class EyeEvent extends Equatable {
  const EyeEvent();

  @override
  List<Object> get props => [];
}

class EyeDateTimeChanged extends EyeEvent {
  @visibleForTesting
  const EyeDateTimeChanged(this.today);

  final DateTime today;

  @override
  List<Object> get props => [today];
}

class EyeBloc extends Bloc<EyeEvent, EyeState> {
  late Timer _timer;

  EyeBloc() : super(EyeState(today: DateTime.now())) {
    on<EyeDateTimeChanged>(_mapDateTimeChanged);

    _timer = _toDayChangeTimer();
  }

  void _mapDateTimeChanged(EyeDateTimeChanged event, Emitter<EyeState> emit) {
    emit(state.copyWith(today: event.today));
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
      this.add(EyeDateTimeChanged(DateTime.now()));
      this._timer.cancel();
      this._timer = _toDayChangeTimer();
    });
  }
}
