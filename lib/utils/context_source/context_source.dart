import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'context_source.freezed.dart';
part 'context_source.g.dart';

enum ContextSourceKind {
  directory,
  file,
  text,
  screenCapture,
}

@freezed
class ContextSource with _$ContextSource {
  const ContextSource._();

  // For directories
  const factory ContextSource.directory({
    required bool canRead,
    required bool canWrite,
    required String path, // Directory path
    required String name,
  }) = DirectoryContext;

  // For files
  const factory ContextSource.file({
    required bool canRead,
    required bool canWrite,
    required String path, // File path
    required String name,
  }) = FileContext;

  // For text
  const factory ContextSource.text({
    required bool canRead,
    required String content, // Text content
    required String name,
  }) = TextContext;

  // For screen captures
  const factory ContextSource.screenCapture({
    required bool canRead,
    required String imagePath, // Path to the image of the screen capture
    required String content, // Text content
    required String name,
  }) = ScreenCaptureContext;

  factory ContextSource.fromJson(Map<String, dynamic> json) =>
      _$ContextSourceFromJson(json);

  String get name {
    return when(
      directory: (bool canRead, bool canWrite, String path, String name) {
        return name;
      },
      file: (bool canRead, bool canWrite, String path, String name) {
        return name;
      },
      text: (bool canRead, String content, String name) {
        return name;
      },
      screenCapture:
          (bool canRead, String imagePath, String content, String name) {
        return name;
      },
    );
  }

  String? get path {
    return when(
      directory: (bool canRead, bool canWrite, String path, String name) {
        return path;
      },
      file: (bool canRead, bool canWrite, String path, String name) {
        return path;
      },
      text: (bool canRead, String content, String name) {
        return null;
      },
      screenCapture:
          (bool canRead, String imagePath, String content, String name) {
        return null;
      },
    );
  }
}
