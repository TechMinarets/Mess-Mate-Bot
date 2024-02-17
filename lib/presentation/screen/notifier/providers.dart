import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/domain/model/chat_bot/response_body.dart';
import 'package:messmatebot/presentation/screen/notifier/chat_response_notifier.dart';

typedef ChatResponseNotifierProvider = AutoDisposeStateNotifierProvider<
    ChatResponseNotifier, List<ResponseBody>>;

final ChatResponseNotifierProvider chatResponseNotifierProvider =
    AutoDisposeStateNotifierProvider(
  (ref) => ChatResponseNotifier(),
);
