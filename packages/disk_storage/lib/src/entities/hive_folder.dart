import 'dart:io';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

// part 'download_item.g.dart';

@HiveType(typeId: 1)
class HiveFolder extends HiveObject {
  @HiveField(1)
  String path;

  @HiveField(2)
  String name;

  @HiveField(3)
  String extension;

  @HiveField(4)
  String? summary;

  @HiveField(11)
  String status;

  HiveFolder({
    this.path = "",
    required this.name,
    this.extension = '',
    this.status = "In Queue",
  });

  factory HiveFolder.from(String path) {
    return HiveFolder(
      path: const Uuid().v4(),
      name: "fileName",
      extension: "extension",
    );
  }
}
