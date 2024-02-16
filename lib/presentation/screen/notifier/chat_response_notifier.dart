import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/domain/model/chat_bot/response_body.dart';
import 'package:messmatebot/domain/usecase/get_chat_bot_response_use_case.dart';
import 'package:messmatebot/injection_container/injection_container.dart';

class ChatResponseNotifier extends StateNotifier<List<ResponseBody>> {
  ChatResponseNotifier()
      : super([ResponseBody(response: 'Hi! I am your AI Assistant!')]) {
    fetchChatBotResponse(requestBody: null);
  }

  Future<void> fetchChatBotResponse({required RequestBody? requestBody}) async {
    if (requestBody == null) {
      return;
    }
    state.add(ResponseBody(response: 'Typing...'));
    final useCase = getIt<GetChatBotResponseUseCase>();
    final response = await useCase(requestBody: requestBody);
    state = state.sublist(0, state.length - 1) + [response];
  }
}
