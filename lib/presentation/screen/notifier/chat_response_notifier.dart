import 'package:flutter/material.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/domain/model/chat_bot/response_body.dart';
import 'package:messmatebot/domain/usecase/get_chat_bot_response_use_case.dart';
import 'package:messmatebot/injection_container/injection_container.dart';

class ChatResponseNotifier extends ChangeNotifier {
  List<ResponseBody> _responseList = [
    ResponseBody(response: 'Hi! I am your AI Assistant!')
  ];

  List<ResponseBody> get responseList => _responseList;

  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  Future<void> fetchChatBotResponse({required RequestBody? requestBody}) async {
    if (requestBody == null) {
      return;
    }
    _responseList.add(ResponseBody(response: 'Typing...'));
    final useCase = getIt<GetChatBotResponseUseCase>();
    final response = await useCase(requestBody: requestBody);
    _responseList =
        _responseList.sublist(0, _responseList.length - 1) + [response];
    notifyListeners();
  }
}
