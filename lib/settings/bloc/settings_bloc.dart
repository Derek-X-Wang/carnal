// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';

class SettingsState extends Equatable {
  const SettingsState();

  SettingsState copyWith() {
    return SettingsState();
  }

  @override
  List<Object?> get props => [];
}

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final TextEditingController apiKeyController = TextEditingController();
  final TextEditingController ignoreFilesController = TextEditingController();

  SettingsBloc() : super(const SettingsState()) {}

  @override
  Future<void> close() {
    apiKeyController.dispose();
    ignoreFilesController.dispose();
    return super.close();
  }
}

extension Helpers on SettingsBloc {}
