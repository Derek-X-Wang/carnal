import 'dart:io';
import 'package:glob/glob.dart';
import 'package:crypto/crypto.dart';

import 'tree_node.dart';

export 'tree_node.dart';
export 'tools.dart';

// skipIgnored: initially plan to include ignored files in the tree, but sometime the tree become too big, using this to skip ignored files
// isIgnored: if the current directory is ignored
Future<TreeNode> buildTree(String path, List<Glob> parentIgnores,
    {bool isIgnored = false, bool skipIgnored = true}) async {
  var dir = Directory(path);
  var children = <String, TreeNode>{};
  var gitIgnoreGlobs = await getGitIgnoreGlobs(path);
  var allIgnores = [...parentIgnores, ...gitIgnoreGlobs];
  // current node is ignored if all children are ignored
  bool isAllChildrenIgnored = true;

  await for (var entity in dir.list(followLinks: false)) {
    bool isEntityIgnored = isPathIgnored(entity.path, path, allIgnores);
    if (isEntityIgnored && skipIgnored) continue;
    if (entity is File && !entity.path.endsWith('.gitignore')) {
      DateTime lastModified = await entity.lastModified();
      int size = await entity.length();
      DateTime lastScanned = DateTime.now();
      String hash = isEntityIgnored ? '' : await generateHash(entity.path);
      children[entity.path] = TreeNode(entity.path,
          isIgnored: isEntityIgnored,
          size: size,
          modifiedAt: lastModified,
          scannedAt: lastScanned,
          hash: hash);
      if (!isEntityIgnored) isAllChildrenIgnored = false;
    } else if (entity is Directory) {
      var childNode =
          await buildTree(entity.path, allIgnores, isIgnored: isEntityIgnored);
      children[entity.path] = childNode;
      if (!childNode.isIgnored) isAllChildrenIgnored = false;
    }
  }

  return TreeNode(path,
      children: children, isIgnored: isIgnored || isAllChildrenIgnored);
}

Future<List<Glob>> getGitIgnoreGlobs(String path) async {
  var gitIgnoreFile = File('$path/.gitignore');
  if (await gitIgnoreFile.exists()) {
    var lines = await gitIgnoreFile.readAsLines();
    return lines
        .where((line) => line.trim().isNotEmpty && !line.trim().startsWith('#'))
        // Not sure why glob doesn't match **/, this is a patch
        // TODO: Fix this
        .map((line) => line.startsWith('/') ? line.substring(1) : line)
        .map((line) => line.startsWith('**/') ? line.substring(3) : line)
        .map((line) =>
            line.endsWith('/') ? line.substring(0, line.length - 1) : line)
        .where((line) => line.trim().isNotEmpty)
        .map((pattern) => Glob(pattern))
        .toList();
  }
  return [];
}

bool isPathIgnored(String path, String basePath, List<Glob> gitIgnoreGlobs) {
  // Make the path relative to the base directory
  var relativePath = path.replaceFirst(basePath, '');

  // Remove the leading slash if it exists
  if (relativePath.startsWith('/')) {
    relativePath = relativePath.substring(1);
  }

  // Print debug info
  print('Relative Path: $relativePath');

  // Match against the relative path
  return gitIgnoreGlobs.any((glob) {
    print(
        'Testing pattern: $relativePath against $glob result: ${glob.matches(relativePath)}');
    return glob.matches(relativePath);
  });
}

Future<String> generateHash(String path) async {
  final file = File(path);
  if (await file.exists()) {
    final bytes = await file.readAsBytes();
    return sha256.convert(bytes).toString();
  }
  return '';
}

class TreeParsedProgress {
  final int total;
  final int done;
  final int percentage;

  TreeParsedProgress({required this.total, required this.done})
      : percentage = (total == 0) ? 0 : ((done / total) * 100).round();
}

TreeParsedProgress calculateProgress(TreeNode node) {
  int total = 0;
  int done = 0;

  void traverse(TreeNode node) {
    if (node.children.isEmpty && !node.isIgnored) {
      total += 1;
      if (node.parsedAt != null) {
        done += 1;
      }
    }
    node.children.values.forEach(traverse);
  }

  traverse(node);

  return TreeParsedProgress(total: total, done: done);
}
