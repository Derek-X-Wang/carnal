import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Settings extends Equatable {
  final List<ActionItem> actions;
  final DispatchSettings dispatch;
  final UserTheme theme;

  const Settings(
      {required this.actions, required this.dispatch, required this.theme});

  Settings copyWith(
      {List<ActionItem>? actions,
      DispatchSettings? dispatch,
      UserTheme? theme}) {
    return Settings(
        actions: actions ?? this.actions,
        dispatch: dispatch ?? this.dispatch,
        theme: theme ?? this.theme);
  }

  @override
  List<Object?> get props => [actions, dispatch, theme];

  @override
  String toString() {
    return 'Settings { }';
  }

  SettingsEntity toEntity() {
    return SettingsEntity(
      actions: actions,
      dispatch: dispatch.toEntity(),
      theme: theme,
    );
  }

  static Settings fromEntity(SettingsEntity entity) {
    return Settings(
      actions: entity.actions,
      dispatch: entity.dispatch == null
          ? DispatchSettings.empty
          : DispatchSettings.fromEntity(entity.dispatch!),
      theme: entity.theme,
    );
  }
}

@immutable
class DispatchSettings extends Equatable {
  final DateTime startTime;
  final DateTime? endTime;
  final double? randomBlockPercentage;
  final int scheduleDays;

  const DispatchSettings({
    required this.startTime,
    this.endTime,
    this.randomBlockPercentage,
    this.scheduleDays = 7,
  });

  DispatchSettings copyWith(
      {DateTime? startTime,
      DateTime? endTime,
      double? randomBlockPercentage,
      int? scheduleDays}) {
    return DispatchSettings(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      randomBlockPercentage:
          randomBlockPercentage ?? this.randomBlockPercentage,
      scheduleDays: scheduleDays ?? this.scheduleDays,
    );
  }

  @override
  List<Object?> get props =>
      [startTime, endTime, randomBlockPercentage, scheduleDays];

  @override
  String toString() {
    return 'DispatchSettings {  }';
  }

  DispatchSettingsEntity toEntity() {
    return DispatchSettingsEntity(
      startTime: startTime,
      endTime: endTime,
      randomBlockPercentage: randomBlockPercentage,
      scheduleDays: scheduleDays,
    );
  }

  static DispatchSettings fromEntity(DispatchSettingsEntity entity) {
    return DispatchSettings(
      startTime: entity.startTime,
      endTime: entity.endTime,
      randomBlockPercentage: entity.randomBlockPercentage,
      scheduleDays: entity.scheduleDays,
    );
  }

  static final empty =
      DispatchSettings(startTime: DateTime.now(), scheduleDays: 10);

  DateTime? get calculatedEndTime {
    var end = endTime;
    if (endTime == null) {
      end = startTime.add(Duration(days: scheduleDays));
    }
    return end;
  }
}
