import 'package:messmatebot/data/repository/chat_bot_repository_impl.dart';
import 'package:messmatebot/domain/repository/chat_bot_repository.dart';
import 'package:messmatebot/injection_container/injection_container.dart';

Future<void> setUpRepositoryModule() async {
  // Repository
  getIt.registerLazySingleton<ChatBotRepository>(
    () => ChatBotRepositoryImpl(
      chatBotDataSource: getIt(),
    ),
  );
}
