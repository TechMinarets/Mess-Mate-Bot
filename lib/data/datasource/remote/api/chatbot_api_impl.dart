import 'package:messmatebot/data/datasource/remote/api/chatbot_api.dart';
import 'package:messmatebot/data/datasource/remote/utils/api_client.dart';

class ChatBotApiImpl implements ChatBotApi {
  final ApiClient _client;
  static const String chatbotUrl = 'chatbot/';

  ChatBotApiImpl({required ApiClient client}) : _client = client;

  @override
  Future getChatbotResponse({required String prompt}) async {
    final response = await _client.post(
      path: chatbotUrl,
      data: {'prompt': prompt},
      converter: (json) => json,
    );
    return response;
  }
}
