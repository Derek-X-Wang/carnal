import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class FileAppendTool extends Tool {
  FileAppendTool()
      : super(
          name: 'file_append',
          description: 'Appends content to the end of an existing file.'
              'The input to this tool should be a valid json with following fields:'
              'path: the path to the file, string, e.g. ["/home/file.dart", "/home/user/file.dart"];'
              'content: the content to be appended at the end, string;'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final inputJson = jsonDecode(toolInput) as Map<String, dynamic>;
      final file = File(inputJson['path'] as String);
      final content = inputJson['content'] as String;

      if (await file.exists()) {
        final fileAppender = file.openWrite(mode: FileMode.append);
        fileAppender.write(content);
        await fileAppender.flush();
        await fileAppender.close();
        return "Content appended successfully.";
      } else {
        return "File does not exist.";
      }
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
