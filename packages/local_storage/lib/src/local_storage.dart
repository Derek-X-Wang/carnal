library local_storage;

import 'dart:io';

import 'package:meta/meta.dart';

import 'package:local_storage/src/box_storage.dart';

class StorageNotFound implements Exception {
  /// {@macro storage_not_found}
  const StorageNotFound();

  @override
  String toString() {
    return 'Storage was accessed before it was initialized.\n'
        'Please ensure that storage has been initialized.\n\n'
        'For example:\n\n'
        'HydratedBloc.storage = await HydratedStorage.build();';
  }
}

/// {@template local_storage}
/// Implementation of [Storage] which uses [package:hive](https://pub.dev/packages/hive)
/// to persist and retrieve state changes from the local device.
/// {@endtemplate}
class LocalStorage {
  /// {@macro local_storage}
  @visibleForTesting
  LocalStorage(this._box);

  /// Init an instance of [LocalStorage].
  static Future<void> build({
    required Directory storageDirectory,
  }) async {
    final boxStorage = await BoxStorage.build(
      storageDirectory: storageDirectory,
    );
    _instance = LocalStorage(boxStorage);
  }

  static LocalStorage? _instance;

  /// Returns an instance of [LocalStorage].
  static LocalStorage get instance {
    if (_instance == null) throw const StorageNotFound();
    return _instance!;
  }

  final BoxStorage _box;

  /// Reads a value from storage associated with the [key].
  String? readString(String domainKey, String domainVersion, String key) =>
      _box.read('local/$domainKey/$domainVersion/$key') as String?;

  /// Writes the [value] to storage associated with the [key].
  Future<void> writeString(
          String domainKey, String domainVersion, String key, String value) =>
      _box.write('local/$domainKey/$domainVersion/$key', value);
}
