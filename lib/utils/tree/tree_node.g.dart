// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeNode _$TreeNodeFromJson(Map<String, dynamic> json) => TreeNode(
      json['path'] as String,
      isIgnored: json['isIgnored'] as bool? ?? false,
      children: (json['children'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, TreeNode.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      size: json['size'] as int?,
      modifiedAt: json['modifiedAt'] == null
          ? null
          : DateTime.parse(json['modifiedAt'] as String),
      scannedAt: json['scannedAt'] == null
          ? null
          : DateTime.parse(json['scannedAt'] as String),
      parsedAt: json['parsedAt'] == null
          ? null
          : DateTime.parse(json['parsedAt'] as String),
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$TreeNodeToJson(TreeNode instance) => <String, dynamic>{
      'path': instance.path,
      'isIgnored': instance.isIgnored,
      'children': instance.children.map((k, e) => MapEntry(k, e.toJson())),
      'size': instance.size,
      'modifiedAt': instance.modifiedAt?.toIso8601String(),
      'scannedAt': instance.scannedAt?.toIso8601String(),
      'parsedAt': instance.parsedAt?.toIso8601String(),
      'hash': instance.hash,
    };
