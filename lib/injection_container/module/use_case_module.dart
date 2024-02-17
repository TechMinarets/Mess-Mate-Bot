import 'package:messmatebot/domain/usecase/category/create_new_category_use_case.dart';
import 'package:messmatebot/domain/usecase/category/delete_category_use_case.dart';
import 'package:messmatebot/domain/usecase/category/get_category_use_case.dart';
import 'package:messmatebot/domain/usecase/category/update_category_use_case.dart';
import 'package:messmatebot/domain/usecase/get_chat_bot_response_use_case.dart';
import 'package:messmatebot/domain/usecase/save_user_info_use_case.dart';
import 'package:messmatebot/injection_container/injection_container.dart';

Future<void> setUpUseCaseModule() async {
  await _setUpChatbotUseCases();
  await _setUpAccountUseCases();
  await _setUpCategoryUseCases();
}

Future<void> _setUpCategoryUseCases() async {
  getIt.registerLazySingleton(
    () => GetCategoryUseCase(categoryApi: getIt()),
  );

  getIt.registerLazySingleton(
    () => CreateNewCategoryUseCase(categoryApi: getIt()),
  );

  getIt.registerLazySingleton(
    () => UpdateCategoryUseCase(categoryApi: getIt()),
  );

  getIt.registerLazySingleton(
    () => DeleteCategoryUseCase(categoryApi: getIt()),
  );
}

Future<void> _setUpAccountUseCases() async {
  getIt.registerLazySingleton(
    () => SaveUserInfoUseCase(accountRepository: getIt()),
  );
}

Future<void> _setUpChatbotUseCases() async {
  getIt.registerLazySingleton(
    () => GetChatBotResponseUseCase(chatBotRepository: getIt()),
  );
}
