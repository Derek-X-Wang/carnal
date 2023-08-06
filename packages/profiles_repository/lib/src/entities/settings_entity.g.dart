// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsEntity _$SettingsEntityFromJson(Map<String, dynamic> json) =>
    SettingsEntity(
      actions: (json['actions'] as List<dynamic>)
          .map((e) => ActionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dispatch: json['dispatch'] == null
          ? null
          : DispatchSettingsEntity.fromJson(
              json['dispatch'] as Map<String, dynamic>),
      theme: UserTheme.fromJson(json['theme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsEntityToJson(SettingsEntity instance) =>
    <String, dynamic>{
      'actions': instance.actions.map((e) => e.toJson()).toList(),
      'dispatch': instance.dispatch?.toJson(),
      'theme': instance.theme.toJson(),
    };

DispatchSettingsEntity _$DispatchSettingsEntityFromJson(
        Map<String, dynamic> json) =>
    DispatchSettingsEntity(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      randomBlockPercentage:
          (json['randomBlockPercentage'] as num?)?.toDouble(),
      scheduleDays: json['scheduleDays'] as int? ?? 7,
    );

Map<String, dynamic> _$DispatchSettingsEntityToJson(
        DispatchSettingsEntity instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'randomBlockPercentage': instance.randomBlockPercentage,
      'scheduleDays': instance.scheduleDays,
    };

ActionItem _$ActionItemFromJson(Map<String, dynamic> json) => ActionItem(
      title: json['title'] as String,
      icon: ActionItemIcon.fromJson(json['icon'] as Map<String, dynamic>),
      notification: json['notification'] == null
          ? null
          : ActionItemNotification.fromJson(
              json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActionItemToJson(ActionItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'icon': instance.icon.toJson(),
      'notification': instance.notification?.toJson(),
    };

ActionItemIcon _$ActionItemIconFromJson(Map<String, dynamic> json) =>
    ActionItemIcon(
      color: json['color'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$ActionItemIconToJson(ActionItemIcon instance) =>
    <String, dynamic>{
      'color': instance.color,
      'code': instance.code,
    };

ActionItemNotification _$ActionItemNotificationFromJson(
        Map<String, dynamic> json) =>
    ActionItemNotification(
      enabled: json['enabled'] as bool,
      hasData: json['hasData'] as bool,
    );

Map<String, dynamic> _$ActionItemNotificationToJson(
        ActionItemNotification instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'hasData': instance.hasData,
    };

UserTheme _$UserThemeFromJson(Map<String, dynamic> json) => UserTheme(
      appearance: json['appearance'] as String,
    );

Map<String, dynamic> _$UserThemeToJson(UserTheme instance) => <String, dynamic>{
      'appearance': instance.appearance,
    };
