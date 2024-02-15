import 'package:messmatebot/data/datasource/remote/source/chat_bot_data_source_impl.dart';
import 'package:messmatebot/data/repository/source/remote/chat_bot_data_source.dart';
import 'package:messmatebot/injection_container/injection_container.dart';

Future<void> setUpDataSourceModule() async {
  // Core
  getIt.registerLazySingleton<ChatBotDataSource>(
    () => ChatBotDataSourceImpl(chatBotApi: getIt()),
  );
}
