import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class DirectoryRenameTool extends Tool {
  DirectoryRenameTool()
      : super(
          name: 'directory_rename',
          description: 'Renames a directory.'
              'The input to this tool should be a valid json with following fields:'
              'oldPath: the path of the directory that need to be rename, string, e.g. ["/home", "/home/user"];'
              'newPath: the path of the new directory, string, e.g. ["/new-home", "/home/new-user"];'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final inputJson = jsonDecode(toolInput) as Map<String, dynamic>;
      final oldDirectory = Directory(inputJson['oldPath'] as String);
      final newDirectory = inputJson['newPath'] as String;

      if (await oldDirectory.exists()) {
        await oldDirectory.rename(newDirectory);
        return "Directory renamed successfully.";
      } else {
        final oldFile = File(inputJson['oldPath'] as String);
        if (await oldFile.exists()) {
          return "Directory does not exist. It's a file.";
        }
        return "Directory does not exist.";
      }
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
