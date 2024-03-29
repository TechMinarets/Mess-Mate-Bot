import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messmatebot/auth/signup_page.dart';
import 'package:messmatebot/presentation/screen/auth/auth_screen.dart';
import 'package:messmatebot/presentation/screen/auth/root/root_screen.dart';
import 'package:messmatebot/presentation/screen/home/chatbot_screen.dart';
import 'package:messmatebot/presentation/screen/home/content_table.dart';
import 'package:messmatebot/presentation/screen/home/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String root = '/';
  static const String home = '/home';
  static const String signup = '/signup';
  static const String auth = '/auth';
  static const String chatBot = '/chatBot';
  static const String contentPage = '/contentPage';
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
        name: Routes.auth,
        path: '/auth',
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            name: Routes.auth,
            child: AuthScreen(),
          );
        },
      ),
      GoRoute(
        name: Routes.chatBot,
        path: '/chatBot',
        pageBuilder: (context, state) {
          final queryParameters = state.uri.queryParameters;
          return NoTransitionPage(
            name: Routes.chatBot,
            child: ChatBotScreen(
                categoryId: int.parse(queryParameters['category_id']!)),
          );
        },
      ),
      GoRoute(
        name: Routes.contentPage,
        path: '/contentPage',
        pageBuilder: (context, state) {
          final queryParameters = state.uri.queryParameters;
          return NoTransitionPage(
            name: Routes.chatBot,
            child: DataListView(),
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
