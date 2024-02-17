import 'package:messmatebot/data/repository/source/remote/chat_bot_data_source.dart';
import 'package:messmatebot/domain/model/chat_bot/chatbot_message.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/domain/repository/chat_bot_repository.dart';

class ChatBotRepositoryImpl implements ChatBotRepository {
  final ChatBotDataSource _chatBotDataSource;

  ChatBotRepositoryImpl({
    required ChatBotDataSource chatBotDataSource,
  }) : _chatBotDataSource = chatBotDataSource;

  @override
  Future<List<ChatBotMessage>> getChatBotMessages(
      {required int categoryId}) async {
    final response =
        await _chatBotDataSource.getChatBotMessages(categoryId: categoryId);
    List<ChatBotMessage> result = [];
    for (var data in response) {
      result.add(
        ChatBotMessage(
          prompt: data['prompt'],
          response: data['response'],
          categoryId: data['category'],
        ),
      );
    }
    return result;
  }

  @override
  Future<ChatBotMessage> sendChatBotMessage(
      {required RequestBody requestBody}) async {
    final response = await _chatBotDataSource.sendChatBotMessage(
      requestBody: {
        'prompt': requestBody.prompt,
        'response': 'tamim is bolod',
        'category': requestBody.categoryId,
      },
    );
    return ChatBotMessage(
      prompt: response['prompt'],
      response: response['response'],
      categoryId: response['category'],
    );
  }
}
