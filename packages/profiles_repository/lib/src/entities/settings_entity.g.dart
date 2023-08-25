// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsEntity _$SettingsEntityFromJson(Map<String, dynamic> json) =>
    SettingsEntity(
      credentials: json['credentials'] == null
          ? null
          : CredentialsEntity.fromJson(
              json['credentials'] as Map<String, dynamic>),
      theme: UserThemeEntity.fromJson(json['theme'] as Map<String, dynamic>),
      ignoreSettings: json['ignoreSettings'] == null
          ? null
          : IgnoreSettingsEntity.fromJson(
              json['ignoreSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsEntityToJson(SettingsEntity instance) =>
    <String, dynamic>{
      'credentials': instance.credentials?.toJson(),
      'ignoreSettings': instance.ignoreSettings?.toJson(),
      'theme': instance.theme.toJson(),
    };

CredentialsEntity _$CredentialsEntityFromJson(Map<String, dynamic> json) =>
    CredentialsEntity(
      openAiApiKey: json['openAiApiKey'] as String,
    );

Map<String, dynamic> _$CredentialsEntityToJson(CredentialsEntity instance) =>
    <String, dynamic>{
      'openAiApiKey': instance.openAiApiKey,
    };

IgnoreSettingsEntity _$IgnoreSettingsEntityFromJson(
        Map<String, dynamic> json) =>
    IgnoreSettingsEntity(
      rules: json['rules'] as String,
    );

Map<String, dynamic> _$IgnoreSettingsEntityToJson(
        IgnoreSettingsEntity instance) =>
    <String, dynamic>{
      'rules': instance.rules,
    };

UserThemeEntity _$UserThemeEntityFromJson(Map<String, dynamic> json) =>
    UserThemeEntity(
      appearance: json['appearance'] as String,
    );

Map<String, dynamic> _$UserThemeEntityToJson(UserThemeEntity instance) =>
    <String, dynamic>{
      'appearance': instance.appearance,
    };
