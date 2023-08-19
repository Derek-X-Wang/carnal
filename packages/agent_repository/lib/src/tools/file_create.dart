import 'dart:async';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class FileCreateTool extends Tool {
  FileCreateTool()
      : super(
          name: 'file_create',
          description: 'Creates a new file.'
              'The input to this tool should be a valid file path.'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final file = File(toolInput);

      if (await file.exists()) {
        return "File already exists.";
      }
      final directory = Directory(toolInput);
      if (await directory.exists()) {
        return "Directory already exists.";
      }

      await file.create();
      return "File created successfully.";
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
