import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/deprecated/eye/eye.dart';

// List<Page> onGenerateTodayViewPages(TodayFlowState state, List<Page<dynamic>> pages) {
//   return [TodayPage.page()];
// }

final GoRoute route = GoRoute(
  path: '/eye',
  name: 'eye',
  pageBuilder: (BuildContext context, GoRouterState state) {
    return EyePage.page();
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
