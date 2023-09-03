import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WindowSizeNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is GoRoute) {
      final goRoute = route as GoRoute;
      final path = goRoute.name;
      _resizeWindowForRoute(path!);
    }
  }

  void _resizeWindowForRoute(String path) {
    // final desiredSize = routeToWindowSize[path];
    // if (desiredSize != null) {
    //   windowManager.setSize(desiredSize);
    // }
  }
}
