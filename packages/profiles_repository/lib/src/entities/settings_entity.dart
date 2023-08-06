// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'settings_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SettingsEntity {
  final List<ActionItem> actions;
  final DispatchSettingsEntity? dispatch;
  final UserTheme theme;

  const SettingsEntity(
      {required this.actions, required this.dispatch, required this.theme});

  @override
  String toString() {
    return 'Settings { }';
  }

  factory SettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$SettingsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsEntityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DispatchSettingsEntity {
  final DateTime startTime;
  final DateTime? endTime;
  final double? randomBlockPercentage;
  final int scheduleDays;

  const DispatchSettingsEntity({
    required this.startTime,
    this.endTime,
    this.randomBlockPercentage,
    this.scheduleDays = 7,
  });

  factory DispatchSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$DispatchSettingsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DispatchSettingsEntityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ActionItem {
  ActionItem({
    required this.title,
    required this.icon,
    this.notification,
  });

  factory ActionItem.fromJson(Map<String, dynamic> json) =>
      _$ActionItemFromJson(json);
  Map<String, dynamic> toJson() => _$ActionItemToJson(this);

  final String title;
  final ActionItemIcon icon;
  final ActionItemNotification? notification;
}

@JsonSerializable()
class ActionItemIcon {
  ActionItemIcon({
    required this.color,
    required this.code,
  });

  factory ActionItemIcon.fromJson(Map<String, dynamic> json) =>
      _$ActionItemIconFromJson(json);
  Map<String, dynamic> toJson() => _$ActionItemIconToJson(this);

  final String color;
  final String code;
}

@JsonSerializable()
class ActionItemNotification {
  ActionItemNotification({
    required this.enabled,
    required this.hasData,
  });

  factory ActionItemNotification.fromJson(Map<String, dynamic> json) =>
      _$ActionItemNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$ActionItemNotificationToJson(this);

  final bool enabled;
  final bool hasData;
}

@JsonSerializable()
class UserTheme {
  UserTheme({
    required this.appearance,
  });

  factory UserTheme.fromJson(Map<String, dynamic> json) =>
      _$UserThemeFromJson(json);
  Map<String, dynamic> toJson() => _$UserThemeToJson(this);

  final String appearance;

  static UserTheme get empty => UserTheme(appearance: "dark");
}
