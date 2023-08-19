import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class FileReplaceTool extends Tool {
  FileReplaceTool()
      : super(
          name: 'file_replace',
          description: 'Replaces the entire content of a file.'
              'The input to this tool should be a valid json with following fields:'
              'path: the path to the file, string, e.g. ["/home", "/home/user/file.dart"];'
              'content: the new content, string;'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final inputJson = jsonDecode(toolInput) as Map<String, dynamic>;
      final file = File(inputJson['path'] as String);
      final content = inputJson['content'] as String;

      if (await file.exists()) {
        await file.writeAsString(content);
        return "File replaced successfully.";
      } else {
        return "File does not exist.";
      }
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
