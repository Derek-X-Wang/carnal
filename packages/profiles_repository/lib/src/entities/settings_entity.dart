// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'settings_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SettingsEntity {
  final CredentialsEntity? credentials;
  final IgnoreSettingsEntity? ignoreSettings;
  final UserThemeEntity theme;

  const SettingsEntity(
      {required this.credentials,
      required this.theme,
      required this.ignoreSettings});

  @override
  String toString() {
    return 'Settings { }';
  }

  factory SettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$SettingsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsEntityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CredentialsEntity {
  final String openAiApiKey;

  const CredentialsEntity({
    required this.openAiApiKey,
  });

  factory CredentialsEntity.fromJson(Map<String, dynamic> json) =>
      _$CredentialsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CredentialsEntityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IgnoreSettingsEntity {
  final String rules;

  const IgnoreSettingsEntity({
    required this.rules,
  });

  factory IgnoreSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$IgnoreSettingsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$IgnoreSettingsEntityToJson(this);
}

@JsonSerializable()
class UserThemeEntity {
  UserThemeEntity({
    required this.appearance,
  });

  factory UserThemeEntity.fromJson(Map<String, dynamic> json) =>
      _$UserThemeEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserThemeEntityToJson(this);

  final String appearance;

  static UserThemeEntity get empty => UserThemeEntity(appearance: "dark");
}
