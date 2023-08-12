import 'tree_node.dart';

// void printTree(TreeNode node, String prefix) {
//   print('${prefix}${node.name} ${node.isIgnored ? "(ignored)" : ""}');
//   node.children.values.forEach((child) => printTree(child, '$prefix  '));
// }

// String stringifyTree(TreeNode node, String prefix) {
//   var buffer = StringBuffer();
//   buffer.writeln('${prefix}${node.name} ${node.isIgnored ? "(ignored)" : ""}');
//   node.children.values
//       .forEach((child) => buffer.write(stringifyTree(child, '$prefix  ')));
//   return buffer.toString();
// }

// void main() async {
//   var rootPath =
//       Directory.current.path; // Path to the directory you want to explore
//   var tree = await buildTree(rootPath, []);
//   printTree(tree, '');
// }

void printTree(TreeNode node, String prefix,
    {bool isLast = true, int depth = -1}) {
  if (depth == 0 || node.isIgnored)
    return; // Skip ignored nodes or if depth reached

  var connector = isLast ? '╰─ ' : '├─ ';
  print('$prefix$connector${node.name}');

  var childPrefix = isLast ? '   ' : '│  ';
  var children = node.children.values.where((n) => !n.isIgnored).toList();
  for (var i = 0; i < children.length; i++) {
    printTree(children[i], '$prefix$childPrefix',
        isLast: i == children.length - 1, depth: depth - 1);
  }
}

String stringifyTree(TreeNode node, String prefix,
    {bool isLast = true, int depth = -1}) {
  if (depth == 0 || node.isIgnored)
    return ''; // Skip ignored nodes or if depth reached

  var buffer = StringBuffer();
  var connector = isLast ? '╰─ ' : '├─ ';
  buffer.writeln('$prefix$connector${node.name}');

  var childPrefix = isLast ? '   ' : '│  ';
  var children = node.children.values.where((n) => !n.isIgnored).toList();
  for (var i = 0; i < children.length; i++) {
    buffer.write(stringifyTree(children[i], '$prefix$childPrefix',
        isLast: i == children.length - 1, depth: depth - 1));
  }
  return buffer.toString();
}

void iterateNonIgnored(TreeNode node, void Function(TreeNode) action) {
  if (node.isIgnored) return; // Skip ignored nodes

  action(node); // Do something with the node

  for (var child in node.children.values) {
    iterateNonIgnored(child, action);
  }
}

List<TreeNode> treeToList(TreeNode node) {
  if (node.isIgnored) return []; // Skip ignored nodes

  var list = [node]; // Include this node

  for (var child in node.children.values) {
    list.addAll(treeToList(child)); // Include non-ignored children
  }

  return list;
}
