// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'entities.dart';

part 'profile_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileEntity extends Equatable {
  final String name;
  final SettingsEntity settings;

  const ProfileEntity({
    required this.name,
    required this.settings,
  });

  @override
  List<Object?> get props => [name, settings];

  @override
  String toString() {
    return 'UserEntity { name: $name }';
  }

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);

  /// Firebase: handle firebase snapshot
  // factory ProfileEntity.fromSnapshot(fs.DocumentSnapshot snapshot) {
  //   // https://github.com/flutter/flutter/issues/16589
  //   final data = jsonDecode(jsonEncode(snapshot.data()));
  //   Map<String, dynamic> map = { "id": snapshot.id };
  //   map.addAll(data);
  //   return ProfileEntity.fromJson(map);
  // }
  Map<String, dynamic> toSnapshotData() {
    var map = _$ProfileEntityToJson(this);
    map.remove("id");
    return map;
  }
}
