part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppUserChanged extends AppEvent {
  @visibleForTesting
  const AppUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class AppLifecycleChanged extends AppEvent {
  const AppLifecycleChanged(this.state);

  final AppLifecycleState state;

  @override
  List<Object> get props => [state];
}

class AppCalendarsSyncRequested extends AppEvent {}

class AppInitialized extends AppEvent {}

class WatcherItemsChanged extends AppEvent {
  const WatcherItemsChanged(this.items);

  final List<WatcherItem> items;

  @override
  List<Object> get props => [items];
}

class WatcherItemAdded extends AppEvent {
  const WatcherItemAdded(this.item);

  final WatcherItem item;

  @override
  List<Object> get props => [item];
}

class WatcherItemRemoved extends AppEvent {
  const WatcherItemRemoved(this.item);

  final WatcherItem item;

  @override
  List<Object> get props => [item];
}

class WatchFileChanged extends AppEvent {
  const WatchFileChanged(this.item, this.event);

  final WatcherItem item;
  final WatchEvent event;

  @override
  List<Object> get props => [item, event];
}
