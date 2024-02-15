import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/domain/model/chat_bot/response_body.dart';

abstract class ChatBotRepository {
  Future<ResponseBody> getChatBotResponse({required RequestBody requestBody});
}
