import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/domain/model/chat_bot/response_body.dart';
import 'package:messmatebot/domain/repository/chat_bot_repository.dart';

class GetChatBotResponseUseCase {
  final ChatBotRepository _chatBotRepository;

  GetChatBotResponseUseCase({required ChatBotRepository chatBotRepository})
      : _chatBotRepository = chatBotRepository;

  Future<ResponseBody> call({required RequestBody requestBody}) async {
    return _chatBotRepository.getChatBotResponse(requestBody: requestBody);
  }
}
