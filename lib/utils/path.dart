import 'dart:io';

enum PathKind { file, directory, web, unknown }

PathKind checkPathKindSync(String path) {
  final uri = Uri.tryParse(path);
  if (uri == null || (!uri.isScheme('http') && !uri.isScheme('https'))) {
    final file = File(path);
    final directory = Directory(path);
    if (file.existsSync()) {
      return PathKind.file;
    } else if (directory.existsSync()) {
      return PathKind.directory;
    }
  } else if (uri.isScheme('http') || uri.isScheme('https')) {
    return PathKind.web;
  }
  return PathKind.unknown;
}

bool isLocalPathSync(String path) {
  final PathKind kind = checkPathKindSync(path);
  switch (kind) {
    case PathKind.file:
    case PathKind.directory:
      return true;
    case PathKind.web:
    case PathKind.unknown:
      return false;
  }
}

Future<PathKind> checkPathKind(String path) async {
  final uri = Uri.tryParse(path);
  if (uri == null || (!uri.isScheme('http') && !uri.isScheme('https'))) {
    final file = File(path);
    final directory = Directory(path);
    if (await file.exists()) {
      return PathKind.file;
    } else if (await directory.exists()) {
      return PathKind.directory;
    }
  } else if (uri.isScheme('http') || uri.isScheme('https')) {
    return PathKind.web;
  }
  return PathKind.unknown;
}

List<String> getAllFilePaths(String folderPath) {
  var dir = Directory(folderPath);
  List<String> filePaths = [];

  try {
    List<FileSystemEntity> entities = dir.listSync(recursive: true);
    for (FileSystemEntity entity in entities) {
      if (entity is File) {
        filePaths.add(entity.path);
      }
    }
  } catch (e) {
    print('Error reading directory: $e');
  }

  return filePaths;
}

Future<bool> isValidPath(String path) async {
  return await File(path).exists() || await Directory(path).exists();
}

// void printTree(String directoryPath, [String prefix = '']) {
//   final dir = Directory(directoryPath);

//   try {
//     final list = dir.listSync();
//     for (var i = 0; i < list.length; i++) {
//       final FileSystemEntity entity = list[i];
//       final isLast = i == list.length - 1;
//       print(
//           '$prefix${isLast ? '└── ' : '├── '}${entity.uri.pathSegments.last}');
//       if (entity is Directory) {
//         printTree(entity.path, '$prefix${isLast ? '    ' : '│   '}');
//       }
//     }
//   } catch (e) {
//     print('Error reading directory: $e');
//   }
// }

// String buildTree(String directoryPath, [String prefix = '']) {
//   final dir = Directory(directoryPath);
//   var buffer = StringBuffer();

//   try {
//     final list = dir.listSync();
//     for (var i = 0; i < list.length; i++) {
//       final FileSystemEntity entity = list[i];
//       final isLast = i == list.length - 1;
//       buffer.writeln(
//           '$prefix${isLast ? '└── ' : '├── '}${entity.uri.pathSegments.last}');
//       if (entity is Directory) {
//         buffer.write(
//             buildTree(entity.path, '$prefix${isLast ? '    ' : '│   '}'));
//       }
//     }
//   } catch (e) {
//     print('Error reading directory: $e');
//   }

//   return buffer.toString();
// }

// void writeTree(String directoryPath, String filePath) {
//   final file = File(filePath);
//   final tree = buildTree(directoryPath);
//   file.writeAsStringSync(tree);
// }
