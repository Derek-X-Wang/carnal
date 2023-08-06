import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:authentication_repository/authentication_repository.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.g.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(User user) => add(AppUserChanged(user));

  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          const AppState(),
        ) {
    on<AppUserChanged>(_mapUserChanged);
    // on<AppLogoutRequested>(
    //     (event, emit) => unawaited(_authenticationRepository.logOut()));
    on<AppLifecycleChanged>(_mapLifecycleChanged);

    // _userSubscription = _authenticationRepository.user.listen(_onUserChanged);
  }

  @override
  AppState fromJson(Map<String, dynamic> json) => json['value'] as AppState;

  @override
  Map<String, AppState> toJson(AppState state) => {'value': state};

  Future<void> _mapUserChanged(
      AppUserChanged event, Emitter<AppState> emit) async {
    // if (event.user.isNotEmpty) {
    //   if (event.user.isAnonymous) {
    //     emit(AppState.anonymous(event.user));
    //   } else {
    //     emit(AppState.authenticated(event.user));
    //   }
    // } else {
    //   /// AppState.unauthenticated is not used
    //   /// login to a new anonymous user when the current user is logged out
    //   /// _mapUserChangedToState will be triggered again after logInAnonymously
    //   await _authenticationRepository.logInAnonymously();
    //   emit(state);
    // }
  }

  Future<void> _mapLifecycleChanged(
      AppLifecycleChanged event, Emitter<AppState> emit) async {
    switch (event.state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

extension Helpers on AppBloc {
  // Future<AppState> calendarsSync() async {
  //   final valid = await isValidSyncState(state);
  //   if (!valid) return state;
  //   final dispatchments = await _dispatchmentsRepository.queryDispatchments(state.user.id);
  //   await taskProgressCheck(dispatchments);
  //   return state;
  // }
}
