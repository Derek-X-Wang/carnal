import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:watcher/watcher.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/utils/path.dart';
import 'package:carnal/utils/tree/tree_node.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.g.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;
  final Map<String, Watcher> _watchers = {};
  final Map<String, StreamSubscription> _watcherSubscriptions = {};

  void _onUserChanged(User user) => add(AppUserChanged(user));

  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          const AppState(items: []),
        ) {
    on<AppUserChanged>(_mapUserChanged);
    // on<AppLogoutRequested>(
    //     (event, emit) => unawaited(_authenticationRepository.logOut()));
    on<AppLifecycleChanged>(_mapLifecycleChanged);

    on<WatcherItemsChanged>(_mapWatcherItemsChanged);
    on<WatcherItemAdded>(_mapWatcherItemAdded);
    on<WatcherItemRemoved>(_mapWatcherItemRemoved);
    on<WatchFileChanged>(_mapWatchFileChanged);

    // _userSubscription = _authenticationRepository.user.listen(_onUserChanged);
    // recreate watcher and subscriptions for each item
    _syncWatcherItems(state.items);
  }

  @override
  AppState fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  @override
  Map<String, dynamic> toJson(AppState state) => _$AppStateToJson(state);

  @override
  Future<void> close() {
    for (final subscription in _watcherSubscriptions.values) {
      subscription.cancel();
    }
    _userSubscription.cancel();
    return super.close();
  }
}

extension AppEvents on AppBloc {
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
}

extension WatchEvents on AppBloc {
  void _mapWatcherItemsChanged(
      WatcherItemsChanged event, Emitter<AppState> emit) {
    // for each item, create a watcher if it doesn't exist
    final items = _syncWatcherItems(event.items);
    emit(state.copyWith(items: items));
  }

  void _mapWatcherItemAdded(WatcherItemAdded event, Emitter<AppState> emit) {
    final items = [...state.items, event.item];
    add(WatcherItemsChanged(items));
  }

  void _mapWatcherItemRemoved(
      WatcherItemRemoved event, Emitter<AppState> emit) {
    final items = state.items.where((item) => item != event.item).toList();
    add(WatcherItemsChanged(items));
  }

  void _mapWatchFileChanged(
      WatchFileChanged event, Emitter<AppState> emit) async {
    final watchEvent = event.event;
    print(watchEvent);
    switch (watchEvent.type) {
      case ChangeType.ADD: // convert to text form and add to db
        break;
      case ChangeType.MODIFY: // convert to text form and update db
        break;
      case ChangeType.REMOVE: // remove from db
        break;
    }
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

  List<WatcherItem> _syncWatcherItems(List<WatcherItem> watcherItems) {
    final items = watcherItems.where((e) => isLocalPathSync(e.src)).toList();

    // Remove watchers and subscriptions for items no longer being watched
    final currentKeys = _watchers.keys.toList();
    for (final key in currentKeys) {
      if (items.every((item) => item.src != key)) {
        _watcherSubscriptions[key]?.cancel();
        _watchers.remove(key);
        _watcherSubscriptions.remove(key);
      }
    }

    // Update existing watchers if necessary

    // Create new watchers and subscriptions for items not yet being watched
    for (final item in items) {
      if (!_watchers.containsKey(item.src)) {
        final watcher = Watcher(item.src);
        final subscription = watcher.events.listen((event) {
          add(WatchFileChanged(item, event));
        });
        _watchers[item.src] = watcher;
        _watcherSubscriptions[item.src] = subscription;
      }
    }

    return items;
  }
}
