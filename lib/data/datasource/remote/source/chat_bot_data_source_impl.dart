import 'package:messmatebot/data/datasource/remote/api/chatbot_api.dart';
import 'package:messmatebot/data/repository/source/remote/chat_bot_data_source.dart';

class ChatBotDataSourceImpl implements ChatBotDataSource {
  final ChatBotApi _chatBotApi;

  ChatBotDataSourceImpl({
    required ChatBotApi chatBotApi,
  }) : _chatBotApi = chatBotApi;

  @override
  Future getChatBotMessages({required int categoryId}) async {
    return await _chatBotApi.getChatbotMessages(categoryId: categoryId);
  }

  @override
  Future sendChatBotMessage({required Map<String, dynamic> requestBody}) async {
    return await _chatBotApi.sendChatBotMessage(requestBody: requestBody);
  }
}
