// contain the following properties:
// user, profile/settings, top_purposes

import 'dart:async';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/utils/platform_util.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:profiles_repository/profiles_repository.dart';
import 'package:window_manager/window_manager.dart';

class SettingsState extends Equatable {
  final String openAiApiKey;
  final String ignoreFiles;

  const SettingsState({
    required this.openAiApiKey,
    required this.ignoreFiles,
  });

  SettingsState copyWith({
    String? openaiApiKey,
    String? ignoreFiles,
  }) {
    return SettingsState(
      openAiApiKey: openaiApiKey ?? this.openAiApiKey,
      ignoreFiles: ignoreFiles ?? this.ignoreFiles,
    );
  }

  @override
  List<Object?> get props => [openAiApiKey, ignoreFiles];
}

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsSaveRequested extends SettingsEvent {}

class SettingsOpenAiApiKeyChanged extends SettingsEvent {
  const SettingsOpenAiApiKeyChanged(this.key);

  final String key;

  @override
  List<Object> get props => [key];
}

class SettingsIgnoreFilesChanged extends SettingsEvent {
  const SettingsIgnoreFilesChanged(this.rules);

  final String rules;

  @override
  List<Object> get props => [rules];
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AuthenticationRepository _authenticationRepository;
  final ProfilesRepository _profilesRepository;
  final TextEditingController apiKeyController;
  final TextEditingController ignoreFilesController;

  final GlobalKey _bannersViewKey = GlobalKey();
  final GlobalKey messagesViewKey = GlobalKey();
  final GlobalKey inputViewKey = GlobalKey();
  final GlobalKey _resultsViewKey = GlobalKey();
  Timer? _resizeTimer;

  void _onOpenAiApiKeyChanged() =>
      add(SettingsOpenAiApiKeyChanged(apiKeyController.text));
  void _onIgnoreFilesChanged() =>
      add(SettingsIgnoreFilesChanged(ignoreFilesController.text));

  SettingsBloc({
    required AuthenticationRepository authenticationRepository,
    required ProfilesRepository profilesRepository,
    required Settings settings,
  })  : _authenticationRepository = authenticationRepository,
        _profilesRepository = profilesRepository,
        apiKeyController =
            TextEditingController(text: settings.credentials.openAiApiKey),
        ignoreFilesController =
            TextEditingController(text: settings.ignoreSettings.rules),
        super(SettingsState(
            openAiApiKey: settings.credentials.openAiApiKey,
            ignoreFiles: settings.ignoreSettings.rules)) {
    on<SettingsSaveRequested>(_mapSaveRequested);
    on<SettingsOpenAiApiKeyChanged>(_mapOpenAiApiKeyChanged);
    on<SettingsIgnoreFilesChanged>(_mapIgnoreFilesChanged);

    // Add listeners to the TextEditingControllers
    apiKeyController.addListener(_onOpenAiApiKeyChanged);
    ignoreFilesController.addListener(_onIgnoreFilesChanged);
  }

  @override
  Future<void> close() {
    apiKeyController.removeListener(_onOpenAiApiKeyChanged);
    ignoreFilesController.removeListener(_onIgnoreFilesChanged);
    apiKeyController.dispose();
    ignoreFilesController.dispose();
    return super.close();
  }
}

extension SettingsEvents on SettingsBloc {
  Future<void> _mapSaveRequested(
      SettingsSaveRequested event, Emitter<SettingsState> emit) async {
    final user = _authenticationRepository.currentUser;
    final settings = await _profilesRepository.settings(user.id).first;
    final newSettings = settings.copyWith(
        credentials: settings.credentials
            .copyWith(openAiApiKey: apiKeyController.text.trim()),
        ignoreSettings: settings.ignoreSettings
            .copyWith(rules: ignoreFilesController.text.trim()));
    await _profilesRepository.updateSettings(user.id, newSettings);
  }

  void _mapOpenAiApiKeyChanged(
      SettingsOpenAiApiKeyChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(openaiApiKey: event.key));
  }

  void _mapIgnoreFilesChanged(
      SettingsIgnoreFilesChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(ignoreFiles: event.rules));
  }
}

extension Helpers on SettingsBloc {}

extension Window on SettingsBloc {
  void windowResize() {
    // if (Navigator.of(context).canPop()) return;

    if (_resizeTimer != null && _resizeTimer!.isActive) {
      _resizeTimer?.cancel();
    }
    _resizeTimer = Timer.periodic(const Duration(milliseconds: 10), (_) async {
      if (!kIsMacOS) {
        await Future.delayed(const Duration(milliseconds: 100));
      }

      const defaultMaxWindowHeight = 460.0;
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
