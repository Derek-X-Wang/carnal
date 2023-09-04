import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

// NOTE: This take me a night to figure out how to use nested freezed
// Need to be in the same file otherwise runner doesn't functioning correctly
@freezed
class Profile with _$Profile {
  const Profile._();

  const factory Profile({
    required Settings settings,
    required List<ContextSource> sources,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  static const empty = Profile(settings: Settings.empty, sources: []);
}

@freezed
class ContextSource with _$ContextSource {
  const ContextSource._();

  // For directories
  const factory ContextSource.directory({
    required bool canRead,
    required bool canWrite,
    required String path, // Directory path
    required String name,
    String? content, // Text content
  }) = DirectoryContext;

  // For files
  const factory ContextSource.file({
    required bool canRead,
    required bool canWrite,
    required String path, // File path
    required String name,
    String? content, // Text content
  }) = FileContext;

  // For text
  const factory ContextSource.text({
    required bool canRead,
    required String content, // Text content
    required String name,
  }) = TextContext;

  // For screen captures
  const factory ContextSource.screenCapture({
    required bool canRead,
    required String imagePath, // Path to the image of the screen capture
    required String name,
    String? content, // Text content
  }) = ScreenCaptureContext;

  factory ContextSource.fromJson(Map<String, dynamic> json) =>
      _$ContextSourceFromJson(json);

  String get name {
    return when(
      directory: (bool canRead, bool canWrite, String path, String name,
          String? content) {
        return name;
      },
      file: (bool canRead, bool canWrite, String path, String name,
          String? content) {
        return name;
      },
      text: (bool canRead, String content, String name) {
        return name;
      },
      screenCapture:
          (bool canRead, String imagePath, String name, String? content) {
        return name;
      },
    );
  }

  String? get path {
    return when(
      directory: (bool canRead, bool canWrite, String path, String name,
          String? content) {
        return path;
      },
      file: (bool canRead, bool canWrite, String path, String name,
          String? content) {
        return path;
      },
      text: (bool canRead, String content, String name) {
        return null;
      },
      screenCapture:
          (bool canRead, String imagePath, String name, String? content) {
        return null;
      },
    );
  }
}

@freezed
class Settings with _$Settings {
  const Settings._();

  const factory Settings({
    required IgnoreSettings ignoreSettings,
    required Credentials credentials,
    required UserTheme theme,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  static const empty = Settings(
      ignoreSettings: IgnoreSettings.empty,
      credentials: Credentials.empty,
      theme: UserTheme.empty);
}

@freezed
class Credentials with _$Credentials {
  const Credentials._();

  const factory Credentials({
    required String openAiApiKey,
  }) = _Credentials;

  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);

  static const empty = Credentials(openAiApiKey: "");
}

@freezed
class IgnoreSettings with _$IgnoreSettings {
  const IgnoreSettings._();

  const factory IgnoreSettings({
    required String rules,
  }) = _IgnoreSettings;

  factory IgnoreSettings.fromJson(Map<String, dynamic> json) =>
      _$IgnoreSettingsFromJson(json);

  static const empty = IgnoreSettings(rules: "");
}

@freezed
class UserTheme with _$UserTheme {
  const UserTheme._();

  const factory UserTheme({
    required String appearance,
  }) = _UserTheme;

  factory UserTheme.fromJson(Map<String, dynamic> json) =>
      _$UserThemeFromJson(json);

  static const empty = UserTheme(appearance: "system");
}
