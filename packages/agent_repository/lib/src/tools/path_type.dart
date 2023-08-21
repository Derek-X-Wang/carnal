import 'dart:async';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class PathTypeTool extends Tool {
  PathTypeTool()
      : super(
          name: 'path_type',
          description: 'Detect a path is a file, a directory or a link.'
              'The input to this tool should be a valid path.'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final directory = Directory(toolInput);

      if (await directory.exists()) {
        return "The path is directory.";
      }

      final file = File(toolInput);
      if (await file.exists()) {
        return "The path is file.";
      }

      final link = Link(toolInput);
      if (await link.exists()) {
        return "The path is link.";
      }

      return "No file, directory or link exists at this path.";
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
