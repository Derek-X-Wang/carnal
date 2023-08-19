import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';

final class FileUpdateTool extends Tool {
  FileUpdateTool()
      : super(
          name: 'file_update',
          description:
              'Updates an existing file by performing a search-and-replace operation.'
              'This operation only updates the first occurrence of the matched string.'
              'The input to this tool should be a valid json with following fields:'
              'path: the path to the file, string, e.g. ["/home/file.dart", "/home/user/file.dart"];'
              'search: the content to be matched, string;'
              'replace: the content to replace the matched content, string;'
              'The output of this tool is a string that said operation succeeded or has an error.',
        );

  @override
  Future<String> runInternalString(final String toolInput) async {
    try {
      final inputJson = jsonDecode(toolInput) as Map<String, dynamic>;
      final file = File(inputJson['path'] as String);
      final search = inputJson['search'] as String;
      final replace = inputJson['replace'] as String;

      if (await file.exists()) {
        var contents = await file.readAsString();
        contents = contents.replaceFirst(search, replace);
        await file.writeAsString(contents);
        return "File updated successfully.";
      } else {
        return "File does not exist.";
      }
    } catch (e) {
      return "An error occurred: ${e.toString()}";
    }
  }
}
