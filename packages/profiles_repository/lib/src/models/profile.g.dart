// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
      sources: (json['sources'] as List<dynamic>)
          .map((e) => ContextSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'settings': instance.settings.toJson(),
      'sources': instance.sources.map((e) => e.toJson()).toList(),
    };

_$DirectoryContext _$$DirectoryContextFromJson(Map<String, dynamic> json) =>
    _$DirectoryContext(
      canRead: json['canRead'] as bool,
      canWrite: json['canWrite'] as bool,
      path: json['path'] as String,
      name: json['name'] as String,
      content: json['content'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DirectoryContextToJson(_$DirectoryContext instance) =>
    <String, dynamic>{
      'canRead': instance.canRead,
      'canWrite': instance.canWrite,
      'path': instance.path,
      'name': instance.name,
      'content': instance.content,
      'runtimeType': instance.$type,
    };

_$FileContext _$$FileContextFromJson(Map<String, dynamic> json) =>
    _$FileContext(
      canRead: json['canRead'] as bool,
      canWrite: json['canWrite'] as bool,
      path: json['path'] as String,
      name: json['name'] as String,
      content: json['content'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FileContextToJson(_$FileContext instance) =>
    <String, dynamic>{
      'canRead': instance.canRead,
      'canWrite': instance.canWrite,
      'path': instance.path,
      'name': instance.name,
      'content': instance.content,
      'runtimeType': instance.$type,
    };

_$TextContext _$$TextContextFromJson(Map<String, dynamic> json) =>
    _$TextContext(
      canRead: json['canRead'] as bool,
      content: json['content'] as String,
      name: json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TextContextToJson(_$TextContext instance) =>
    <String, dynamic>{
      'canRead': instance.canRead,
      'content': instance.content,
      'name': instance.name,
      'runtimeType': instance.$type,
    };

_$ScreenCaptureContext _$$ScreenCaptureContextFromJson(
        Map<String, dynamic> json) =>
    _$ScreenCaptureContext(
      canRead: json['canRead'] as bool,
      imagePath: json['imagePath'] as String,
      name: json['name'] as String,
      content: json['content'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ScreenCaptureContextToJson(
        _$ScreenCaptureContext instance) =>
    <String, dynamic>{
      'canRead': instance.canRead,
      'imagePath': instance.imagePath,
      'name': instance.name,
      'content': instance.content,
      'runtimeType': instance.$type,
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
