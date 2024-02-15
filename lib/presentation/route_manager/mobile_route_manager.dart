import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messmatebot/presentation/route_manager/route_manager.dart';

class MobileRouteManager implements RouteManager {
  final BuildContext context;

  MobileRouteManager(this.context);

  @override
  bool canPop() => context.canPop();

  @override
  void pop<T extends Object?>([T? result]) => context.pop(result);

  @override
  void goNamed(
    String routeName, {
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
  }) {
    context.goNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
  }) {
    return context.pushNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }
}
