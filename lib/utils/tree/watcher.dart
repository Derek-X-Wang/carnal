import 'package:equatable/equatable.dart';
import 'package:path/path.dart' as p;
import 'package:json_annotation/json_annotation.dart';
import 'package:carnal/utils/tree/tree_node.dart';

part 'watcher.g.dart';

// Need ignore rule
// Need progress tracking
@JsonSerializable(explicitToJson: true)
class WatcherItem {
  final String src;
  bool canRead;
  bool canWrite;
  TreeNode? tree;

  // Computed property to get the name
  String get name => p.basename(src);

  WatcherItem(this.src,
      {this.canRead = true, this.canWrite = false, this.tree});

  factory WatcherItem.fromJson(Map<String, dynamic> json) =>
      _$WatcherItemFromJson(json);
  Map<String, dynamic> toJson() => _$WatcherItemToJson(this);
}
