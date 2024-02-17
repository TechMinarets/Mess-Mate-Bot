import 'package:flutter/material.dart';
import 'package:messmatebot/presentation/route_manager/mobile_route_manager.dart';

abstract class RouteManager {
  factory RouteManager.of(BuildContext context) {
    return MobileRouteManager(context);
  }

  bool canPop();

  void pop<T extends Object?>([T? result]);

  void goNamed(
    String routeName, {
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
  });

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
  });

  void goToHomeScreen();

  void goToChatBotPage({required int categoryId});
}
