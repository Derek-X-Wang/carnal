// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectoryContext _$$DirectoryContextFromJson(Map<String, dynamic> json) =>
    _$DirectoryContext(
      canRead: json['canRead'] as bool,
      canWrite: json['canWrite'] as bool,
      path: json['path'] as String,
      name: json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DirectoryContextToJson(_$DirectoryContext instance) =>
    <String, dynamic>{
      'canRead': instance.canRead,
      'canWrite': instance.canWrite,
      'path': instance.path,
      'name': instance.name,
      'runtimeType': instance.$type,
    };

_$FileContext _$$FileContextFromJson(Map<String, dynamic> json) =>
    _$FileContext(
      canRead: json['canRead'] as bool,
      canWrite: json['canWrite'] as bool,
      path: json['path'] as String,
      name: json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FileContextToJson(_$FileContext instance) =>
    <String, dynamic>{
      'canRead': instance.canRead,
      'canWrite': instance.canWrite,
      'path': instance.path,
      'name': instance.name,
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
      content: json['content'] as String,
      name: json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ScreenCaptureContextToJson(
        _$ScreenCaptureContext instance) =>
    <String, dynamic>{
      'canRead': instance.canRead,
      'imagePath': instance.imagePath,
      'content': instance.content,
      'name': instance.name,
      'runtimeType': instance.$type,
    };
