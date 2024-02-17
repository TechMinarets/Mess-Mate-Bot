import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messmatebot/auth/login_page.dart';
import 'package:messmatebot/auth/signup_page.dart';
import 'package:messmatebot/presentation/screen/auth/root/root_screen.dart';
import 'package:messmatebot/presentation/screen/home/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String root = '/';
  static const String home = '/home';
  static const String signup = '/signup';
  static const String login = '/login';
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
          child: RootScreen(),
        ),
      ),
      GoRoute(
        name: Routes.home,
        path: '/home',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            name: Routes.home,
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
        name: Routes.signup,
        path: '/signup',
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            name: Routes.signup,
            child: SignupScreen(),
          );
        },
      ),
      GoRoute(
        name: Routes.login,
        path: '/login',
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            name: Routes.login,
            child: LoginScreen(),
          );
        },
      ),
    ],
    redirect: (context, state) {
      final currentPath = state.uri.path;

      return null;
    },
  );
}

class AnalyticsAwareRouteObserver extends RouteObserver<PageRoute<dynamic>> {}
