abstract class ChatBotApi {
  Future getChatbotMessages({required int categoryId});

  Future sendChatBotMessage({required Map<String, dynamic> requestBody});

  Future getTableData({required int categoryId});
}
