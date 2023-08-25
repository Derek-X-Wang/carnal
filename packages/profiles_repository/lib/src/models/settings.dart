import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Settings extends Equatable {
  final IgnoreSettings ignoreSettings;
  final Credentials credentials;
  final UserTheme theme;

  const Settings(
      {required this.ignoreSettings,
      required this.credentials,
      required this.theme});

  Settings copyWith(
      {IgnoreSettings? ignoreSettings,
      Credentials? credentials,
      UserTheme? theme}) {
    return Settings(
        ignoreSettings: ignoreSettings ?? this.ignoreSettings,
        credentials: credentials ?? this.credentials,
        theme: theme ?? this.theme);
  }

  @override
  List<Object?> get props => [ignoreSettings, credentials, theme];

  @override
  String toString() {
    return 'Settings { }';
  }

  SettingsEntity toEntity() {
    return SettingsEntity(
      ignoreSettings: ignoreSettings.toEntity(),
      credentials: credentials.toEntity(),
      theme: theme.toEntity(),
    );
  }

  static Settings fromEntity(SettingsEntity entity) {
    return Settings(
      ignoreSettings: entity.ignoreSettings == null
          ? IgnoreSettings.empty
          : IgnoreSettings.fromEntity(entity.ignoreSettings!),
      credentials: entity.credentials == null
          ? Credentials.empty
          : Credentials.fromEntity(entity.credentials!),
      theme: entity.theme == null
          ? UserTheme.empty
          : UserTheme.fromEntity(entity.theme!),
    );
  }
}

@immutable
class Credentials extends Equatable {
  final String openAiApiKey;

  const Credentials({
    required this.openAiApiKey,
  });

  Credentials copyWith({
    String? openAiApiKey,
  }) {
    return Credentials(
      openAiApiKey: openAiApiKey ?? this.openAiApiKey,
    );
  }

  @override
  List<Object?> get props => [openAiApiKey];

  @override
  String toString() {
    return 'Credentials {  }';
  }

  CredentialsEntity toEntity() {
    return CredentialsEntity(
      openAiApiKey: openAiApiKey,
    );
  }

  static Credentials fromEntity(CredentialsEntity entity) {
    return Credentials(
      openAiApiKey: entity.openAiApiKey,
    );
  }

  static final empty = Credentials(openAiApiKey: "");
}

@immutable
class IgnoreSettings extends Equatable {
  final String rules;

  const IgnoreSettings({
    required this.rules,
  });

  IgnoreSettings copyWith({
    String? rules,
  }) {
    return IgnoreSettings(
      rules: rules ?? this.rules,
    );
  }

  @override
  List<Object?> get props => [rules];

  @override
  String toString() {
    return 'IgnoreSettings {  }';
  }

  IgnoreSettingsEntity toEntity() {
    return IgnoreSettingsEntity(
      rules: rules,
    );
  }

  static IgnoreSettings fromEntity(IgnoreSettingsEntity entity) {
    return IgnoreSettings(
      rules: entity.rules,
    );
  }

  static final empty = IgnoreSettings(rules: "");
}

@immutable
class UserTheme extends Equatable {
  final String appearance;

  const UserTheme({
    required this.appearance,
  });

  UserTheme copyWith({
    String? appearance,
  }) {
    return UserTheme(
      appearance: appearance ?? this.appearance,
    );
  }

  @override
  List<Object?> get props => [appearance];

  @override
  String toString() {
    return 'UserTheme {  }';
  }

  UserThemeEntity toEntity() {
    return UserThemeEntity(
      appearance: appearance,
    );
  }

  static UserTheme fromEntity(UserThemeEntity entity) {
    return UserTheme(
      appearance: entity.appearance,
    );
  }

  static final empty = UserTheme(appearance: "system");
}
