import 'package:messmatebot/data/datasource/remote/api/chatbot_api.dart';
import 'package:messmatebot/data/repository/source/remote/chat_bot_data_source.dart';

class ChatBotDataSourceImpl implements ChatBotDataSource {
  final ChatBotApi _chatBotApi;

  ChatBotDataSourceImpl({
    required ChatBotApi chatBotApi,
  }) : _chatBotApi = chatBotApi;

  @override
  Future getChatBotResponse({required String prompt}) {
    return _chatBotApi.getChatbotResponse(prompt: prompt);
  }
}
