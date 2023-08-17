import 'dart:async';
import 'dart:io';
import 'package:langchain/langchain.dart';

final class FilesRetrieverTool extends Tool {
  FilesRetrieverTool()
      : super(
          name: 'files_retriever',
          description: 'Useful for getting the files. '
              'The input to this tool should be valid file paths.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final List<String> filePaths = toolInput.split('\n');
      final StringBuffer contentsBuffer = StringBuffer();

      for (final path in filePaths) {
        final file = File(path);
        if (await file.exists()) {
          final contents = await file.readAsString();
          contentsBuffer.writeln("Contents of $path:\n$contents\n");
        } else {
          contentsBuffer.writeln("File $path does not exist.\n");
        }
      }

      return contentsBuffer.toString();
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
