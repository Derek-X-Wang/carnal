import 'package:path/path.dart' as p;
import 'package:json_annotation/json_annotation.dart';

part 'tree_node.g.dart';

@JsonSerializable(explicitToJson: true)
class TreeNode {
  final String path;
  final bool isIgnored;
  final Map<String, TreeNode> children;
  final int? size;
  final DateTime? modifiedAt; // Last time the file was modified based on OS
  final DateTime? scannedAt; // Last time the file was scanned for TreeNodes
  final DateTime? parsedAt; // Last time the file was parsed to text form
  final String? hash; // Hash of the file to detect changes

  // Computed property to get the name
  String get name => p.basename(path);

  TreeNode(
    this.path, {
    this.isIgnored = false,
    this.children = const {},
    this.size,
    this.modifiedAt,
    this.scannedAt,
    this.parsedAt,
    this.hash,
  });

  // JSON serialization
  factory TreeNode.fromJson(Map<String, dynamic> json) =>
      _$TreeNodeFromJson(json);
  Map<String, dynamic> toJson() => _$TreeNodeToJson(this);
}
