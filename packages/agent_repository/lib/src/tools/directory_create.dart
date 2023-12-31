import 'dart:async';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class DirectoryCreateTool extends Tool {
  DirectoryCreateTool()
      : super(
          name: 'directory_create',
          description: 'Creates a new directory.'
              'The input to this tool should be a valid directory path.'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final directory = Directory(toolInput);

      if (await directory.exists()) {
        return "Directory already exists.";
      }
      final file = File(toolInput);
      if (await file.exists()) {
        return "File already exist at this path.";
      }

      await directory.create();
      return "Directory created successfully.";
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
