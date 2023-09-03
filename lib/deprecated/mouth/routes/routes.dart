import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/deprecated/mouth/mouth.dart';

// List<Page> onGenerateTodayViewPages(TodayFlowState state, List<Page<dynamic>> pages) {
//   return [TodayPage.page()];
// }

final GoRoute route = GoRoute(
  path: '/mouth',
  name: 'mouth',
  pageBuilder: (BuildContext context, GoRouterState state) {
    return MouthPage.page();
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
