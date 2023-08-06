import 'dart:io';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

// part 'download_item.g.dart';

@HiveType(typeId: 0)
class HiveFile extends HiveObject {
  @HiveField(1)
  String path;

  @HiveField(2)
  String name;

  @HiveField(3)
  String extension;

  @HiveField(4)
  String? text;

  @HiveField(4)
  String? summary;

  @HiveField(8)
  double progress;

  @HiveField(11)
  String status;

  HiveFile({
    this.path = "",
    required this.name,
    this.extension = '',
    this.text = null,
    this.summary = null,
    required this.progress,
    this.status = "In Queue",
  });

  factory HiveFile.from(String path) {
    return HiveFile(
      path: const Uuid().v4(),
      name: "fileName",
      extension: "extension",
      progress: 0,
    );
  }
}

// // for a file
// await io.File(syncPath).exists();
// io.File(syncPath).existsSync();

// // for a directory
// await io.Directory(syncPath).exists();
// io.Directory(syncPath).existsSync();