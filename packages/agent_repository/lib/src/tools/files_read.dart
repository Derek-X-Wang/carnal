import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class FilesReadTool extends Tool {
  FilesReadTool()
      : super(
          name: 'files_read',
          description: 'Reads the content of multiple files.'
              'The input to this tool should be a valid json of string array represent file paths, e.g. ["/home/file.dart", "/home/user/file.dart"];'
              'The output to this tool should be the content of the files.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final inputPaths = jsonDecode(toolInput) as List<String>;
      final filesContent = <String>[];

      for (final path in inputPaths) {
        final file = File(path);
        if (await file.exists()) {
          final content = await file.readAsString();
          filesContent.add(content);
        } else {
          filesContent.add("File $path does not exist.");
        }
      }

      return jsonEncode(filesContent);
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
