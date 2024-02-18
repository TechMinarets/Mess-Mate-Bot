import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messmatebot/domain/model/chat_bot/chatbot_message.dart';

part 'chatbot_ui_state.freezed.dart';

@freezed
class ChatbotUiState with _$ChatbotUiState {
  const factory ChatbotUiState.loading() = LoadingState;

  const factory ChatbotUiState.success(List<ChatBotMessage> messages) =
      SuccessState;

  const factory ChatbotUiState.error(String message) = ErrorState;
}
