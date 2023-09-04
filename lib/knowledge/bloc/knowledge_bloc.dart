// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:carnal/utils/platform_util.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:profiles_repository/profiles_repository.dart';
import 'package:window_manager/window_manager.dart';

class KnowledgeState extends Equatable {
  const KnowledgeState();

  KnowledgeState copyWith() {
    return KnowledgeState();
  }

  @override
  List<Object?> get props => [];
}

abstract class KnowledgeEvent extends Equatable {
  const KnowledgeEvent();

  @override
  List<Object> get props => [];
}

class KnowledgeContextChanged extends KnowledgeEvent {
  const KnowledgeContextChanged(this.items);

  final List<ContextSource> items;

  @override
  List<Object> get props => [items];
}

class KnowledgeContextAdded extends KnowledgeEvent {
  const KnowledgeContextAdded(this.item);

  final ContextSource item;

  @override
  List<Object> get props => [item];
}

class KnowledgeContextRemoved extends KnowledgeEvent {
  const KnowledgeContextRemoved(this.item);

  final ContextSource item;

  @override
  List<Object> get props => [item];
}

class KnowledgeBloc extends Bloc<KnowledgeEvent, KnowledgeState> {
  final AuthenticationRepository _authenticationRepository;
  final ProfilesRepository _profilesRepository;

  Timer? _resizeTimer;

  Stream<List<ContextSource>> get sources {
    final userId = _authenticationRepository.currentUser.id;
    return _profilesRepository.contextSources(userId);
  }

  KnowledgeBloc({
    required AuthenticationRepository authenticationRepository,
    required ProfilesRepository profilesRepository,
  })  : _profilesRepository = profilesRepository,
        _authenticationRepository = authenticationRepository,
        super(const KnowledgeState()) {
    on<KnowledgeContextChanged>(_mapContextChanged);
    on<KnowledgeContextAdded>(_mapContextAdded);
    on<KnowledgeContextRemoved>(_mapContextRemoved);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

extension KnowledgeEvents on KnowledgeBloc {
  void _mapContextChanged(
      KnowledgeContextChanged event, Emitter<KnowledgeState> emit) async {
    // for each item, create a watcher if it doesn't exist
    // final items = _syncWatcherItems(event.items);
    // emit(state.copyWith(contextSources: event.items));
  }

  void _mapContextAdded(
      KnowledgeContextAdded event, Emitter<KnowledgeState> emit) async {
    final userId = _authenticationRepository.currentUser.id;
    final previous = _profilesRepository.currentContextSources(userId);
    final items = [...previous, event.item];
    await _profilesRepository.updateContextSources(userId, items);
  }

  void _mapContextRemoved(
      KnowledgeContextRemoved event, Emitter<KnowledgeState> emit) async {
    final userId = _authenticationRepository.currentUser.id;
    final previous = _profilesRepository.currentContextSources(userId);
    final items = previous.where((item) => item != event.item).toList();
    await _profilesRepository.updateContextSources(userId, items);
  }
}

extension Window on KnowledgeBloc {
  void windowResize() {
    // if (Navigator.of(context).canPop()) return;

    if (_resizeTimer != null && _resizeTimer!.isActive) {
      _resizeTimer?.cancel();
    }
    _resizeTimer = Timer.periodic(const Duration(milliseconds: 10), (_) async {
      if (!kIsMacOS) {
        await Future.delayed(const Duration(milliseconds: 100));
      }

      const defaultMaxWindowHeight = 500.0;
      const defaultMaxWindowWidth = 400.0;
      try {
        Size oldSize = await windowManager.getSize();
        Size newSize = const Size(
          defaultMaxWindowWidth,
          defaultMaxWindowHeight,
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
