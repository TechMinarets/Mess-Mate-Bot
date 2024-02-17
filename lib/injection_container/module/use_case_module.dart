import 'package:messmatebot/domain/usecase/get_chat_bot_response_use_case.dart';
import 'package:messmatebot/injection_container/injection_container.dart';

Future<void> setUpUseCaseModule() async {
  await _setUpChatbotUseCases();
}

Future<void> _setUpChatbotUseCases() async {
  getIt.registerLazySingleton(
    () => GetChatBotResponseUseCase(chatBotRepository: getIt()),
  );
}
