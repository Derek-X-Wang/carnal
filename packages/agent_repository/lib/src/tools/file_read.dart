import 'dart:async';
import 'dart:io';
import 'package:langchain/langchain.dart';

final class FileReadTool extends Tool {
  FileReadTool()
      : super(
          name: 'file_read',
          description: 'Useful for reading the file. '
              'The input to this tool should be a valid file path.'
              'The output to this tool should be the content of the file.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final file = File(toolInput);
      if (await file.exists()) {
        final contents = await file.readAsString();
        return "File contents:\n$contents";
      } else {
        return "File does not exist.";
      }
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
