abstract class ChatBotDataSource {
  Future getChatBotMessages({required int categoryId});

  Future sendChatBotMessage({required Map<String, dynamic> requestBody});

  Future getTableData({required int categoryId});
}
