class ChatBotMessage {
  final String prompt;
  final String response;
  final int categoryId;

  ChatBotMessage({
    required this.prompt,
    required this.response,
    required this.categoryId,
  });
}
