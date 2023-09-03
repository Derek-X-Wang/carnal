// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:carnal/utils/platform_util.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';
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

class KnowledgeBloc extends Bloc<KnowledgeEvent, KnowledgeState> {
  Timer? _resizeTimer;

  KnowledgeBloc() : super(const KnowledgeState()) {}

  @override
  Future<void> close() {
    return super.close();
  }
}

extension Helpers on KnowledgeBloc {}

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
