import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class PathSearchTool extends Tool {
  PathSearchTool()
      : super(
          name: 'path_search',
          description:
              'Useful for searching file or directory by name in allowed paths. '
              'The input to this tool should be a valid json with following fields:'
              'paths: the paths and sub-paths that the tool can access, string array, e.g. ["/home", "/home/user"];'
              'name: the name of the file or directory to search;'
              'The output of this tool is a string array of the paths of the found files or directories.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final inputJson = jsonDecode(toolInput) as Map<String, dynamic>;
      final paths = List<String>.from(inputJson['paths'] as List<String>);
      final name = inputJson['name'] as String;

      final foundPaths = <String>[];

      for (final path in paths) {
        foundPaths.addAll(await _searchByName(path, name));
      }

      return jsonEncode(foundPaths);
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }

  Future<List<String>> _searchByName(String path, String name) async {
    final directory = Directory(path);
    final foundPaths = List<String>.empty(growable: true);

    if (await directory.exists()) {
      await for (final entity
          in directory.list(recursive: true, followLinks: false)) {
        if (entity.path.endsWith('/$name')) {
          foundPaths.add(entity.path);
        }
      }
    } else {
      print('Directory does not exist');
    }

    return foundPaths;
  }
}
