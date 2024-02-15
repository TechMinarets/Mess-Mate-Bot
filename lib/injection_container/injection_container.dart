import 'package:get_it/get_it.dart';
import 'package:messmatebot/injection_container/module/cache_module.dart';
import 'package:messmatebot/injection_container/module/data_source_module.dart';
import 'package:messmatebot/injection_container/module/network_module.dart';
import 'package:messmatebot/injection_container/module/repository_module.dart';
import 'package:messmatebot/injection_container/module/use_case_module.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  await setUpCacheModule();
  await setUpNetworkModule();
  await setUpDataSourceModule();
  await setUpRepositoryModule();
  await setUpUseCaseModule();
}
