import 'dart:async';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class PathDeleteTool extends Tool {
  PathDeleteTool()
      : super(
          name: 'path_delete',
          description: 'Deletes a file or a directory.'
              'The input to this tool should be a valid path.'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final directory = Directory(toolInput);

      if (await directory.exists()) {
        await directory.delete(recursive: true);
        return "Directory deleted successfully.";
      }

      final file = File(toolInput);
      if (await file.exists()) {
        await file.delete();
        return "File deleted successfully.";
      }

      return "No file or directory exists at this path.";
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
