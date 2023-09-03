import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/settings/settings.dart';
import 'package:carnal/settings/view/settings_api_keys.dart';
import 'package:carnal/settings/view/settings_engines.dart';
import 'package:carnal/settings/view/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profiles_repository/profiles_repository.dart';

// List<Page> onGenerateTodayViewPages(TodayFlowState state, List<Page<dynamic>> pages) {
//   return [TodayPage.page()];
// }

final GoRoute route = GoRoute(
  path: '/settings',
  name: 'settings',
  pageBuilder: (BuildContext context, GoRouterState state) {
    return SettingsPage.page();
  },
  routes: <RouteBase>[
    GoRoute(
      path: 'api-keys',
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsApiKeysPage();
      },
    ),
    GoRoute(
      path: 'engines',
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsEnginesPage();
      },
    ),
  ],
);

final ShellRoute shellRoute = ShellRoute(
  builder: (BuildContext context, GoRouterState state, Widget child) {
    final authenticationRepository =
        RepositoryProvider.of<AuthenticationRepository>(context);
    final user = authenticationRepository.currentUser;
    final profilesRepository =
        RepositoryProvider.of<ProfilesRepository>(context);
    return BlocProvider(
      create: (context) => SettingsBloc(
        authenticationRepository: authenticationRepository,
        profilesRepository: profilesRepository,
        settings: profilesRepository.currentSettings(user.id),
      ),
      child: child,
    );
  },
  routes: <RouteBase>[route],
);
