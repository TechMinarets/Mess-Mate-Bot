import 'package:messmatebot/data/repository/account_repository_impl.dart';
import 'package:messmatebot/data/repository/chat_bot_repository_impl.dart';
import 'package:messmatebot/domain/repository/account_repository.dart';
import 'package:messmatebot/domain/repository/chat_bot_repository.dart';
import 'package:messmatebot/injection_container/injection_container.dart';

Future<void> setUpRepositoryModule() async {
  // Repository
  getIt.registerLazySingleton<ChatBotRepository>(
    () => ChatBotRepositoryImpl(
      chatBotDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(
      accountDataSource: getIt(),
    ),
  );
}
