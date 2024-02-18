import 'package:messmatebot/data/datasource/remote/api/chatbot_api.dart';
import 'package:messmatebot/data/datasource/remote/utils/api_client.dart';

class ChatBotApiImpl implements ChatBotApi {
  final ApiClient _client;

  static const String chatbotUrl = 'category/<category_id>/chat-history';
  static const String tableUrl = 'category/categories/<category_id>/table';

  ChatBotApiImpl({required ApiClient client}) : _client = client;

  @override
  Future getChatbotMessages({required int categoryId}) async {
    final response = await _client.get(
      path: chatbotUrl.replaceFirst('<category_id>', categoryId.toString()),
      converter: (json) => json,
    );
    return response;
  }

  @override
  Future sendChatBotMessage({required Map<String, dynamic> requestBody}) async {
    return await _client.post(
      path: chatbotUrl.replaceFirst(
          '<category_id>', requestBody['category'].toString()),
      data: requestBody,
      converter: (json) => json,
    );
  }

  @override
  Future getTableData({required int categoryId}) async {
    return await _client.get(
      path: tableUrl.replaceFirst('<category_id>', categoryId.toString()),
      converter: (json) => json,
    );
  }
}
