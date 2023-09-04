part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
  anonymous,
  errored,
}

@JsonSerializable(explicitToJson: true)
class AppState extends Equatable {
  final ThemeMode themeMode = ThemeMode.system;

  const AppState();

  AppState copyWith(
      {List<WatcherItem>? items, List<ContextSource>? contextSources}) {
    return const AppState();
  }

  @override
  List<Object> get props => [];

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }
}
