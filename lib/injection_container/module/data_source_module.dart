import 'package:messmatebot/data/datasource/remote/source/account_data_source_impl.dart';
import 'package:messmatebot/data/datasource/remote/source/chat_bot_data_source_impl.dart';
import 'package:messmatebot/data/datasource/source/core_local_data_source_impl.dart';
import 'package:messmatebot/data/repository/source/local/core_local_data_source.dart';
import 'package:messmatebot/data/repository/source/remote/account_data_source.dart';
import 'package:messmatebot/data/repository/source/remote/chat_bot_data_source.dart';
import 'package:messmatebot/injection_container/injection_container.dart';

Future<void> setUpDataSourceModule() async {
  // Core

  getIt.registerLazySingleton<CoreLocalDataSource>(
    () => CoreLocalDataSourceImpl(sharedPref: getIt()),
  );

  getIt.registerLazySingleton<ChatBotDataSource>(
    () => ChatBotDataSourceImpl(chatBotApi: getIt()),
  );

  getIt.registerLazySingleton<AccountDataSource>(
    () => AccountDataSourceImpl(accountApi: getIt()),
  );
}
