// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'settings': instance.settings.toJson(),
    };

_$_Settings _$$_SettingsFromJson(Map<String, dynamic> json) => _$_Settings(
      ignoreSettings: IgnoreSettings.fromJson(
          json['ignoreSettings'] as Map<String, dynamic>),
      credentials:
          Credentials.fromJson(json['credentials'] as Map<String, dynamic>),
      theme: UserTheme.fromJson(json['theme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'ignoreSettings': instance.ignoreSettings.toJson(),
      'credentials': instance.credentials.toJson(),
      'theme': instance.theme.toJson(),
    };

_$_Credentials _$$_CredentialsFromJson(Map<String, dynamic> json) =>
    _$_Credentials(
      openAiApiKey: json['openAiApiKey'] as String,
    );

Map<String, dynamic> _$$_CredentialsToJson(_$_Credentials instance) =>
    <String, dynamic>{
      'openAiApiKey': instance.openAiApiKey,
    };

_$_IgnoreSettings _$$_IgnoreSettingsFromJson(Map<String, dynamic> json) =>
    _$_IgnoreSettings(
      rules: json['rules'] as String,
    );

Map<String, dynamic> _$$_IgnoreSettingsToJson(_$_IgnoreSettings instance) =>
    <String, dynamic>{
      'rules': instance.rules,
    };

_$_UserTheme _$$_UserThemeFromJson(Map<String, dynamic> json) => _$_UserTheme(
      appearance: json['appearance'] as String,
    );

Map<String, dynamic> _$$_UserThemeToJson(_$_UserTheme instance) =>
    <String, dynamic>{
      'appearance': instance.appearance,
    };
