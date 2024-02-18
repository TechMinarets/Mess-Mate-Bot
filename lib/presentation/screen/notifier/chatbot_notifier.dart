import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/domain/model/chat_bot/chatbot_message.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/domain/usecase/chatbot/get_chat_bot_messages_use_case.dart';
import 'package:messmatebot/domain/usecase/chatbot/send_chatbot_message_use_case.dart';
import 'package:messmatebot/injection_container/injection_container.dart';
import 'package:messmatebot/presentation/screen/state/chatbot_ui_state.dart';

class ChatBotNotifier extends StateNotifier<ChatbotUiState> {
  ChatBotNotifier() : super(const ChatbotUiState.loading());

  List<ChatBotMessage> _chatBotMessageList = [];

  Future<void> fetchChatBotMessages(
      {required int categoryId, bool isThisFirstCall = false}) async {
    if (isThisFirstCall && state != const ChatbotUiState.loading()) {
      return;
    }

    try {
      final useCase = getIt<GetChatBotMessagesUseCase>();
      final response = await useCase(categoryId: categoryId);

      state = response.when(
        success: (categoryList) {
          _chatBotMessageList = categoryList;
          return ChatbotUiState.success(categoryList);
        },
        failure: (failure) => ChatbotUiState.error(failure.message),
      );
    } catch (e) {
      state = ChatbotUiState.error(e.toString());
    }
  }

  Future<void> sendChatBotMessage({required RequestBody requestBody}) async {
    // state = const ChatbotUiState.loading();

    try {
      _chatBotMessageList.insert(
          0,
          ChatBotMessage(
            prompt: requestBody.prompt,
            response: 'Typing...',
            categoryId: requestBody.categoryId,
          ));
      final useCase = getIt<SendChatBotMessageUseCase>();
      final response = await useCase(requestBody: requestBody);

      state = response.when(
        success: (categoryList) {
          if (_chatBotMessageList.isNotEmpty) {
            _chatBotMessageList.removeAt(0);
          }

          _chatBotMessageList.insert(0, categoryList);
          return ChatbotUiState.success(_chatBotMessageList);
        },
        failure: (failure) => ChatbotUiState.error(failure.message),
      );
    } catch (e) {
      state = ChatbotUiState.error(e.toString());
    }
  }

  void clearChatBotMessages() {
    state = const ChatbotUiState.loading();
  }
}

final chatBotNotifierProvider =
    StateNotifierProvider<ChatBotNotifier, ChatbotUiState>(
  (ref) => ChatBotNotifier(),
);
