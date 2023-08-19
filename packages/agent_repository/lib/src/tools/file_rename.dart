import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class FileRenameTool extends Tool {
  FileRenameTool()
      : super(
          name: 'file_rename',
          description: 'Renames a file.'
              'The input to this tool should be a valid json with following fields:'
              'oldPath: the path of the file that need to be rename, string, e.g. ["/home/file.dart", "/home/user/file.dart"];'
              'newPath: the path of the new file, string, e.g. ["/home/new-file.ts", "/home/user/new-file.ts"];'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final inputJson = jsonDecode(toolInput) as Map<String, dynamic>;
      final oldFile = File(inputJson['oldPath'] as String);
      final newFile = inputJson['newPath'] as String;

      if (await oldFile.exists()) {
        await oldFile.rename(newFile);
        return "File renamed successfully.";
      } else {
        return "File does not exist.";
      }
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
