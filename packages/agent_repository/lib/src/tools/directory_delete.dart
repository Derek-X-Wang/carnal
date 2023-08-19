import 'dart:async';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class DirectoryDeleteTool extends Tool {
  DirectoryDeleteTool()
      : super(
          name: 'directory_delete',
          description: 'Deletes a directory and its contents.'
              'The input to this tool should be a valid directory path.'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final directory = Directory(toolInput);

      if (await directory.exists()) {
        await directory.delete(recursive: true);
        return "Directory deleted successfully.";
      } else {
        return "Directory does not exist.";
      }
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
