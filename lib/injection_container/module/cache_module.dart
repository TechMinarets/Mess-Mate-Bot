import 'package:messmatebot/injection_container/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setUpCacheModule() async {
  // SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
}
