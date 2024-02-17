import 'package:messmatebot/domain/model/chat_bot/chatbot_message.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/domain/model/core/failure.dart';
import 'package:messmatebot/domain/model/core/result.dart';
import 'package:messmatebot/domain/repository/chat_bot_repository.dart';

class SendChatBotMessageUseCase {
  final ChatBotRepository _chatBotRepository;

  SendChatBotMessageUseCase({required ChatBotRepository chatBotRepository})
      : _chatBotRepository = chatBotRepository;

  Future<Result<ChatBotMessage>> call(
      {required RequestBody requestBody}) async {
    return _chatBotRepository
        .sendChatBotMessage(requestBody: requestBody)
        .then((message) => Result.success(message))
        .onError((Failure failure, _) => Result.failure(failure));
  }
}
