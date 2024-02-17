abstract class ChatBotApi {
  Future getChatbotMessages({required int categoryId});

  Future sendChatBotMessage({required Map<String, dynamic> requestBody});
}
