import 'package:messmatebot/data/repository/source/remote/chat_bot_data_source.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/domain/model/chat_bot/response_body.dart';
import 'package:messmatebot/domain/repository/chat_bot_repository.dart';

class ChatBotRepositoryImpl implements ChatBotRepository {
  final ChatBotDataSource _chatBotDataSource;

  ChatBotRepositoryImpl({
    required ChatBotDataSource chatBotDataSource,
  }) : _chatBotDataSource = chatBotDataSource;

  @override
  Future<ResponseBody> getChatBotResponse(
      {required RequestBody requestBody}) async {
    final result =
        await _chatBotDataSource.getChatBotResponse(prompt: requestBody.prompt);
    return ResponseBody(
      response: result['response'],
    );
  }
}
