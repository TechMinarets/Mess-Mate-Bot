// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:messmatebot/injection_container/injection_container.dart' as di;
// import 'package:messmatebot/presentation/route_manager/routes.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_strategy/url_strategy.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await SharedPreferences.getInstance();
//   await di.setup();
//
//   GoRouter.optionURLReflectsImperativeAPIs = true;
//   setPathUrlStrategy();
//   runApp(const ProviderScope(child: MyApp()));
// }
//
// class MyApp extends ConsumerStatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   ConsumerState<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends ConsumerState<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => ChatResponseNotifier(),
//         )
//       ],
//       child: MaterialApp.router(
//         title: 'Supportify',
//         debugShowCheckedModeBanner: false,
//         routerConfig: AppRouter.router,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messmatebot/injection_container/injection_container.dart' as di;
import 'package:messmatebot/presentation/route_manager/routes.dart';
import 'package:messmatebot/presentation/screen/notifier/chat_response_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferences.getInstance();
  await di.setup();

  GoRouter.optionURLReflectsImperativeAPIs = true;
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatResponseNotifier(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Supportify',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
