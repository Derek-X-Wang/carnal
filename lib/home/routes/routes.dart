import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/home/home.dart';

// List<Page> onGenerateTodayViewPages(TodayFlowState state, List<Page<dynamic>> pages) {
//   return [TodayPage.page()];
// }

final GoRoute route = GoRoute(
  path: '/',
  name: 'home',
  pageBuilder: (BuildContext context, GoRouterState state) {
    return HomePage.page();
  },
  routes: <RouteBase>[],
);
