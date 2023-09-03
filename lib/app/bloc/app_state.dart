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
  final List<WatcherItem> items;
  final List<ContextSource> contextSources;

  const AppState({
    required this.items,
    required this.contextSources,
  });

  AppState copyWith(
      {List<WatcherItem>? items, List<ContextSource>? contextSources}) {
    return AppState(
      items: items ?? this.items,
      contextSources: contextSources ?? this.contextSources,
    );
  }

  @override
  List<Object> get props => [items, contextSources];

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
