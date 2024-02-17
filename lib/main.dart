import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messmatebot/injection_container/injection_container.dart' as di;
import 'package:messmatebot/presentation/route_manager/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCotJ4PQX8RBlNu85VSxqpS1JsqrB9U_Tc",
        appId: "1:682961559262:android:c4989452bdd816ca322c4f",
        messagingSenderId: "682961559262",
        projectId: "messmatebot-b89e4",
        storageBucket: "messmatebot-b89e4.appspot.com"),
  );

  await SharedPreferences.getInstance();
  await di.setup();

  GoRouter.optionURLReflectsImperativeAPIs = true;
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Supportify',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
