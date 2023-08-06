import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/eye/eye.dart' as eye;

final GoRouter router = GoRouter(
  initialLocation: '/eye',
  routes: <RouteBase>[
    eye.route,
  ],
);

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _router = GoRouter(
    initialLocation: '/eye',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      eye.route,
    ],
    // errorBuilder: (context, state) => const NotFoundScreen(),
  );

  GoRouter get router => _router;
}
