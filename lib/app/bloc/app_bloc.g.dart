// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatcherItem _$WatcherItemFromJson(Map<String, dynamic> json) => WatcherItem(
      json['src'] as String,
      canRead: json['canRead'] as bool? ?? true,
      canWrite: json['canWrite'] as bool? ?? false,
    );

Map<String, dynamic> _$WatcherItemToJson(WatcherItem instance) =>
    <String, dynamic>{
      'src': instance.src,
      'canRead': instance.canRead,
      'canWrite': instance.canWrite,
    };

AppState _$AppStateFromJson(Map<String, dynamic> json) => AppState(
      items: (json['items'] as List<dynamic>)
          .map((e) => WatcherItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
