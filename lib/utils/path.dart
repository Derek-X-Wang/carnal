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
