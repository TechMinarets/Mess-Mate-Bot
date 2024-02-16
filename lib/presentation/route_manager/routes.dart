import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messmatebot/presentation/screen/home/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String root = '/';
  static const String home = '/home';
}

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    observers: [AnalyticsAwareRouteObserver()],
    routes: [
      GoRoute(
        name: Routes.root,
        path: '/',
        pageBuilder: (context, state) => const NoTransitionPage(
          name: Routes.root,
          child: Scaffold(body: Center(child: Text('Loading...'))),
        ),
      ),
      GoRoute(
        name: Routes.home,
        path: '/home',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            name: Routes.home,
            child: HomePage(),
          );
        },
      ),
    ],
    redirect: (context, state) {
      final currentPath = state.uri.path;

      if (currentPath == '/') {
        return '/home';
      }
      return null;
    },
  );
}

class AnalyticsAwareRouteObserver extends RouteObserver<PageRoute<dynamic>> {}
