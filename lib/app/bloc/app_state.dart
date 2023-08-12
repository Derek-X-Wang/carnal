part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
  anonymous,
  errored,
}

// Need ignore rule
// Need progress tracking
@JsonSerializable(explicitToJson: true)
class WatcherItem {
  final String src;
  bool canRead;
  bool canWrite;
  TreeNode? tree;

  WatcherItem(this.src,
      {this.canRead = true, this.canWrite = false, this.tree});

  factory WatcherItem.fromJson(Map<String, dynamic> json) =>
      _$WatcherItemFromJson(json);
  Map<String, dynamic> toJson() => _$WatcherItemToJson(this);
}

// @JsonSerializable(explicitToJson: true)
// class UserProfile {
//   final String src;
//   bool canRead;
//   bool canWrite;

//   WatcherItem(this.src, {this.canRead = true, this.canWrite = false});

//   factory WatcherItem.fromJson(Map<String, dynamic> json) =>
//       _$WatcherItemFromJson(json);
//   Map<String, dynamic> toJson() => _$WatcherItemToJson(this);
// }

@JsonSerializable(explicitToJson: true)
class AppState extends Equatable {
  final ThemeMode themeMode = ThemeMode.system;
  final List<WatcherItem> items;

  const AppState({
    required this.items,
  });

  AppState copyWith({List<WatcherItem>? items}) {
    return AppState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];

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
