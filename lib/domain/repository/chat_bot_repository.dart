import 'package:messmatebot/domain/model/chat_bot/chatbot_message.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';

abstract class ChatBotRepository {
  Future<ChatBotMessage> sendChatBotMessage({required RequestBody requestBody});

  Future<List<ChatBotMessage>> getChatBotMessages({required int categoryId});

  Future getTableData({required int categoryId});
}
