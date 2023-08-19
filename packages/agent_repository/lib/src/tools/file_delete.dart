import 'dart:async';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class FileDeleteTool extends Tool {
  FileDeleteTool()
      : super(
          name: 'file_delete',
          description: 'Deletes a file.'
              'The input to this tool should be a valid file path.'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final file = File(toolInput);

      if (await file.exists()) {
        await file.delete();
        return "File deleted successfully.";
      } else {
        return "File does not exist.";
      }
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
