// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) => AppState(
      items: (json['items'] as List<dynamic>)
          .map((e) => WatcherItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      contextSources: (json['contextSources'] as List<dynamic>)
          .map((e) => ContextSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'contextSources': instance.contextSources.map((e) => e.toJson()).toList(),
    };
