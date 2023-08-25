import 'package:carnal/settings/view/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profiles_repository/profiles_repository.dart';

// List<Page> onGenerateTodayViewPages(TodayFlowState state, List<Page<dynamic>> pages) {
//   return [TodayPage.page()];
// }

final GoRoute route = GoRoute(
  path: '/settings',
  name: 'Settings',
  pageBuilder: (BuildContext context, GoRouterState state) {
    return SettingsPage.page();
  },
  routes: <RouteBase>[
    GoRoute(
      path: 'details',
      builder: (BuildContext context, GoRouterState state) {
        return const Text("b");
      },
    ),
  ],
);
