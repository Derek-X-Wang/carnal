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
