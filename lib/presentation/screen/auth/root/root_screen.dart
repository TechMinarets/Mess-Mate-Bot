import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/presentation/route_manager/route_manager.dart';
import 'package:messmatebot/presentation/screen/auth/auth_screen.dart';
import 'package:messmatebot/presentation/screen/auth/notifier/auth_notifier.dart';
import 'package:messmatebot/presentation/screen/auth/state/auth_ui_state.dart';
import 'package:messmatebot/presentation/screen/home/home_screen.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  @override
  Widget build(BuildContext context) {
    ref.read(authNotifierProvider.notifier).checkAuthStatus();
    final authUiState = ref.watch(authNotifierProvider);
    if (authUiState == const AuthUiState.loading()) {
      return const Center(child: CircularProgressIndicator());
    } else if (authUiState == const AuthUiState.authenticated()) {
      RouteManager.of(context).goToHomeScreen();
      return const HomeScreen();
    } else {
      return const AuthScreen();
    }
  }
}
