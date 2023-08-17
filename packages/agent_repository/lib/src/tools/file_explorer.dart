import 'dart:async';
import 'dart:io';
import 'package:langchain/langchain.dart';

final class FileExplorerTool extends Tool {
  FileExplorerTool()
      : super(
            name: 'file_explorer',
            description: 'Useful for listing files in a directory. '
                'The input to this tool should be a valid directory path.');

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      // Check if the input is a valid directory
      final directory = Directory(toolInput);
      if (await directory.exists()) {
        // List the files in the directory
        final files =
            await directory.list().map((entity) => entity.path).toList();
        return "Files in directory:\n${files.join('\n')}";
      } else {
        return "Directory does not exist.";
      }
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
