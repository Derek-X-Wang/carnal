import 'dart:async';
import 'dart:io';
import 'package:langchain/langchain.dart';

final class FileGetTool extends Tool {
  FileGetTool()
      : super(
          name: 'file_retriever',
          description: 'Useful for getting the file. '
              'The input to this tool should be a valid file path.',
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
