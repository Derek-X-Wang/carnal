import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class PathRenameTool extends Tool {
  PathRenameTool()
      : super(
          name: 'path_rename',
          description: 'Renames a file or a directory.'
              'The input to this tool should be a valid json with following fields:'
              'oldPath: the path that need to be renamed, string, e.g. ["/home", "/home/user/file.dart"];'
              'newPath: the new path, string, e.g. ["/new-home", "/home/user/new-file.ts"];'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final inputJson = jsonDecode(toolInput) as Map<String, dynamic>;
      final oldPath = inputJson['oldPath'] as String;
      final newPath = inputJson['newPath'] as String;

      final oldDirectory = Directory(oldPath);
      if (await oldDirectory.exists()) {
        await oldDirectory.rename(newPath);
        return "Directory renamed successfully.";
      }

      final oldFile = File(oldPath);
      if (await oldFile.exists()) {
        await oldFile.rename(newPath);
        return "File renamed successfully.";
      }

      return "No file or directory exists at the oldPath.";
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
