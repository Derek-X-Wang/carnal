// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  Settings get settings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call({Settings settings});

  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Settings settings});

  @override
  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
  }) {
    return _then(_$_Profile(
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile extends _Profile with DiagnosticableTreeMixin {
  const _$_Profile({required this.settings}) : super._();

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  final Settings settings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Profile(settings: $settings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Profile'))
      ..add(DiagnosticsProperty('settings', settings));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(
      this,
    );
  }
}

abstract class _Profile extends Profile {
  const factory _Profile({required final Settings settings}) = _$_Profile;
  const _Profile._() : super._();

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  Settings get settings;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
mixin _$Settings {
  IgnoreSettings get ignoreSettings => throw _privateConstructorUsedError;
  Credentials get credentials => throw _privateConstructorUsedError;
  UserTheme get theme => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call(
      {IgnoreSettings ignoreSettings,
      Credentials credentials,
      UserTheme theme});

  $IgnoreSettingsCopyWith<$Res> get ignoreSettings;
  $CredentialsCopyWith<$Res> get credentials;
  $UserThemeCopyWith<$Res> get theme;
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ignoreSettings = null,
    Object? credentials = null,
    Object? theme = null,
  }) {
    return _then(_value.copyWith(
      ignoreSettings: null == ignoreSettings
          ? _value.ignoreSettings
          : ignoreSettings // ignore: cast_nullable_to_non_nullable
              as IgnoreSettings,
      credentials: null == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as UserTheme,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IgnoreSettingsCopyWith<$Res> get ignoreSettings {
    return $IgnoreSettingsCopyWith<$Res>(_value.ignoreSettings, (value) {
      return _then(_value.copyWith(ignoreSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CredentialsCopyWith<$Res> get credentials {
    return $CredentialsCopyWith<$Res>(_value.credentials, (value) {
      return _then(_value.copyWith(credentials: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserThemeCopyWith<$Res> get theme {
    return $UserThemeCopyWith<$Res>(_value.theme, (value) {
      return _then(_value.copyWith(theme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IgnoreSettings ignoreSettings,
      Credentials credentials,
      UserTheme theme});

  @override
  $IgnoreSettingsCopyWith<$Res> get ignoreSettings;
  @override
  $CredentialsCopyWith<$Res> get credentials;
  @override
  $UserThemeCopyWith<$Res> get theme;
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$_Settings>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ignoreSettings = null,
    Object? credentials = null,
    Object? theme = null,
  }) {
    return _then(_$_Settings(
      ignoreSettings: null == ignoreSettings
          ? _value.ignoreSettings
          : ignoreSettings // ignore: cast_nullable_to_non_nullable
              as IgnoreSettings,
      credentials: null == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as UserTheme,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Settings extends _Settings with DiagnosticableTreeMixin {
  const _$_Settings(
      {required this.ignoreSettings,
      required this.credentials,
      required this.theme})
      : super._();

  factory _$_Settings.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsFromJson(json);

  @override
  final IgnoreSettings ignoreSettings;
  @override
  final Credentials credentials;
  @override
  final UserTheme theme;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Settings(ignoreSettings: $ignoreSettings, credentials: $credentials, theme: $theme)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Settings'))
      ..add(DiagnosticsProperty('ignoreSettings', ignoreSettings))
      ..add(DiagnosticsProperty('credentials', credentials))
      ..add(DiagnosticsProperty('theme', theme));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            (identical(other.ignoreSettings, ignoreSettings) ||
                other.ignoreSettings == ignoreSettings) &&
            (identical(other.credentials, credentials) ||
                other.credentials == credentials) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ignoreSettings, credentials, theme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsToJson(
      this,
    );
  }
}

abstract class _Settings extends Settings {
  const factory _Settings(
      {required final IgnoreSettings ignoreSettings,
      required final Credentials credentials,
      required final UserTheme theme}) = _$_Settings;
  const _Settings._() : super._();

  factory _Settings.fromJson(Map<String, dynamic> json) = _$_Settings.fromJson;

  @override
  IgnoreSettings get ignoreSettings;
  @override
  Credentials get credentials;
  @override
  UserTheme get theme;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

Credentials _$CredentialsFromJson(Map<String, dynamic> json) {
  return _Credentials.fromJson(json);
}

/// @nodoc
mixin _$Credentials {
  String get openAiApiKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialsCopyWith<Credentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialsCopyWith<$Res> {
  factory $CredentialsCopyWith(
          Credentials value, $Res Function(Credentials) then) =
      _$CredentialsCopyWithImpl<$Res, Credentials>;
  @useResult
  $Res call({String openAiApiKey});
}

/// @nodoc
class _$CredentialsCopyWithImpl<$Res, $Val extends Credentials>
    implements $CredentialsCopyWith<$Res> {
  _$CredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openAiApiKey = null,
  }) {
    return _then(_value.copyWith(
      openAiApiKey: null == openAiApiKey
          ? _value.openAiApiKey
          : openAiApiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CredentialsCopyWith<$Res>
    implements $CredentialsCopyWith<$Res> {
  factory _$$_CredentialsCopyWith(
          _$_Credentials value, $Res Function(_$_Credentials) then) =
      __$$_CredentialsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String openAiApiKey});
}

/// @nodoc
class __$$_CredentialsCopyWithImpl<$Res>
    extends _$CredentialsCopyWithImpl<$Res, _$_Credentials>
    implements _$$_CredentialsCopyWith<$Res> {
  __$$_CredentialsCopyWithImpl(
      _$_Credentials _value, $Res Function(_$_Credentials) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openAiApiKey = null,
  }) {
    return _then(_$_Credentials(
      openAiApiKey: null == openAiApiKey
          ? _value.openAiApiKey
          : openAiApiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Credentials extends _Credentials with DiagnosticableTreeMixin {
  const _$_Credentials({required this.openAiApiKey}) : super._();

  factory _$_Credentials.fromJson(Map<String, dynamic> json) =>
      _$$_CredentialsFromJson(json);

  @override
  final String openAiApiKey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Credentials(openAiApiKey: $openAiApiKey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Credentials'))
      ..add(DiagnosticsProperty('openAiApiKey', openAiApiKey));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Credentials &&
            (identical(other.openAiApiKey, openAiApiKey) ||
                other.openAiApiKey == openAiApiKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, openAiApiKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CredentialsCopyWith<_$_Credentials> get copyWith =>
      __$$_CredentialsCopyWithImpl<_$_Credentials>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CredentialsToJson(
      this,
    );
  }
}

abstract class _Credentials extends Credentials {
  const factory _Credentials({required final String openAiApiKey}) =
      _$_Credentials;
  const _Credentials._() : super._();

  factory _Credentials.fromJson(Map<String, dynamic> json) =
      _$_Credentials.fromJson;

  @override
  String get openAiApiKey;
  @override
  @JsonKey(ignore: true)
  _$$_CredentialsCopyWith<_$_Credentials> get copyWith =>
      throw _privateConstructorUsedError;
}

IgnoreSettings _$IgnoreSettingsFromJson(Map<String, dynamic> json) {
  return _IgnoreSettings.fromJson(json);
}

/// @nodoc
mixin _$IgnoreSettings {
  String get rules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IgnoreSettingsCopyWith<IgnoreSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IgnoreSettingsCopyWith<$Res> {
  factory $IgnoreSettingsCopyWith(
          IgnoreSettings value, $Res Function(IgnoreSettings) then) =
      _$IgnoreSettingsCopyWithImpl<$Res, IgnoreSettings>;
  @useResult
  $Res call({String rules});
}

/// @nodoc
class _$IgnoreSettingsCopyWithImpl<$Res, $Val extends IgnoreSettings>
    implements $IgnoreSettingsCopyWith<$Res> {
  _$IgnoreSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rules = null,
  }) {
    return _then(_value.copyWith(
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IgnoreSettingsCopyWith<$Res>
    implements $IgnoreSettingsCopyWith<$Res> {
  factory _$$_IgnoreSettingsCopyWith(
          _$_IgnoreSettings value, $Res Function(_$_IgnoreSettings) then) =
      __$$_IgnoreSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rules});
}

/// @nodoc
class __$$_IgnoreSettingsCopyWithImpl<$Res>
    extends _$IgnoreSettingsCopyWithImpl<$Res, _$_IgnoreSettings>
    implements _$$_IgnoreSettingsCopyWith<$Res> {
  __$$_IgnoreSettingsCopyWithImpl(
      _$_IgnoreSettings _value, $Res Function(_$_IgnoreSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rules = null,
  }) {
    return _then(_$_IgnoreSettings(
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IgnoreSettings extends _IgnoreSettings with DiagnosticableTreeMixin {
  const _$_IgnoreSettings({required this.rules}) : super._();

  factory _$_IgnoreSettings.fromJson(Map<String, dynamic> json) =>
      _$$_IgnoreSettingsFromJson(json);

  @override
  final String rules;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IgnoreSettings(rules: $rules)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IgnoreSettings'))
      ..add(DiagnosticsProperty('rules', rules));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IgnoreSettings &&
            (identical(other.rules, rules) || other.rules == rules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rules);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IgnoreSettingsCopyWith<_$_IgnoreSettings> get copyWith =>
      __$$_IgnoreSettingsCopyWithImpl<_$_IgnoreSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IgnoreSettingsToJson(
      this,
    );
  }
}

abstract class _IgnoreSettings extends IgnoreSettings {
  const factory _IgnoreSettings({required final String rules}) =
      _$_IgnoreSettings;
  const _IgnoreSettings._() : super._();

  factory _IgnoreSettings.fromJson(Map<String, dynamic> json) =
      _$_IgnoreSettings.fromJson;

  @override
  String get rules;
  @override
  @JsonKey(ignore: true)
  _$$_IgnoreSettingsCopyWith<_$_IgnoreSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

UserTheme _$UserThemeFromJson(Map<String, dynamic> json) {
  return _UserTheme.fromJson(json);
}

/// @nodoc
mixin _$UserTheme {
  String get appearance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserThemeCopyWith<UserTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserThemeCopyWith<$Res> {
  factory $UserThemeCopyWith(UserTheme value, $Res Function(UserTheme) then) =
      _$UserThemeCopyWithImpl<$Res, UserTheme>;
  @useResult
  $Res call({String appearance});
}

/// @nodoc
class _$UserThemeCopyWithImpl<$Res, $Val extends UserTheme>
    implements $UserThemeCopyWith<$Res> {
  _$UserThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appearance = null,
  }) {
    return _then(_value.copyWith(
      appearance: null == appearance
          ? _value.appearance
          : appearance // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserThemeCopyWith<$Res> implements $UserThemeCopyWith<$Res> {
  factory _$$_UserThemeCopyWith(
          _$_UserTheme value, $Res Function(_$_UserTheme) then) =
      __$$_UserThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appearance});
}

/// @nodoc
class __$$_UserThemeCopyWithImpl<$Res>
    extends _$UserThemeCopyWithImpl<$Res, _$_UserTheme>
    implements _$$_UserThemeCopyWith<$Res> {
  __$$_UserThemeCopyWithImpl(
      _$_UserTheme _value, $Res Function(_$_UserTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appearance = null,
  }) {
    return _then(_$_UserTheme(
      appearance: null == appearance
          ? _value.appearance
          : appearance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserTheme extends _UserTheme with DiagnosticableTreeMixin {
  const _$_UserTheme({required this.appearance}) : super._();

  factory _$_UserTheme.fromJson(Map<String, dynamic> json) =>
      _$$_UserThemeFromJson(json);

  @override
  final String appearance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserTheme(appearance: $appearance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserTheme'))
      ..add(DiagnosticsProperty('appearance', appearance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserTheme &&
            (identical(other.appearance, appearance) ||
                other.appearance == appearance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appearance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserThemeCopyWith<_$_UserTheme> get copyWith =>
      __$$_UserThemeCopyWithImpl<_$_UserTheme>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserThemeToJson(
      this,
    );
  }
}

abstract class _UserTheme extends UserTheme {
  const factory _UserTheme({required final String appearance}) = _$_UserTheme;
  const _UserTheme._() : super._();

  factory _UserTheme.fromJson(Map<String, dynamic> json) =
      _$_UserTheme.fromJson;

  @override
  String get appearance;
  @override
  @JsonKey(ignore: true)
  _$$_UserThemeCopyWith<_$_UserTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
