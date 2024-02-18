import 'package:messmatebot/domain/model/chat_bot/chatbot_message.dart';
import 'package:messmatebot/domain/model/core/failure.dart';
import 'package:messmatebot/domain/model/core/result.dart';
import 'package:messmatebot/domain/repository/chat_bot_repository.dart';

class GetChatBotMessagesUseCase {
  final ChatBotRepository _chatBotRepository;

  GetChatBotMessagesUseCase({required ChatBotRepository chatBotRepository})
      : _chatBotRepository = chatBotRepository;

  Future<Result<List<ChatBotMessage>>> call({required int categoryId}) async {
    return _chatBotRepository
        .getChatBotMessages(categoryId: categoryId)
        .then((chatBotMessageList) => Result.success(chatBotMessageList))
        .onError((Failure failure, _) => Result.failure(failure));
  }
}
