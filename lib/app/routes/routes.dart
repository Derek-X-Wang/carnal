import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/settings/settings.dart' as settings;
import 'package:carnal/home/home.dart' as home;
import 'package:carnal/knowledge/knowledge.dart' as knowledge;

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    observers: [BotToastNavigatorObserver()],
    routes: <RouteBase>[
      settings.shellRoute,
      home.route,
      knowledge.route,
    ],
    // errorBuilder: (context, state) => const NotFoundScreen(),
  );

  GoRouter get router => _router;
}
