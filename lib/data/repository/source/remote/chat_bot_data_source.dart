abstract class ChatBotDataSource {
  Future getChatBotMessages({required int categoryId});

  Future sendChatBotMessage({required Map<String, dynamic> requestBody});
}
