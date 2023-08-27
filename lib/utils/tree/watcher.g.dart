// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watcher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatcherItem _$WatcherItemFromJson(Map<String, dynamic> json) => WatcherItem(
      json['src'] as String,
      canRead: json['canRead'] as bool? ?? true,
      canWrite: json['canWrite'] as bool? ?? false,
      tree: json['tree'] == null
          ? null
          : TreeNode.fromJson(json['tree'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatcherItemToJson(WatcherItem instance) =>
    <String, dynamic>{
      'src': instance.src,
      'canRead': instance.canRead,
      'canWrite': instance.canWrite,
      'tree': instance.tree?.toJson(),
    };
