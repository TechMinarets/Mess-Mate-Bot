import 'package:messmatebot/domain/model/core/failure.dart';
import 'package:messmatebot/domain/model/core/result.dart';
import 'package:messmatebot/domain/repository/chat_bot_repository.dart';

class GetTableDataUseCase {
  final ChatBotRepository _chatBotRepository;

  GetTableDataUseCase({required ChatBotRepository chatBotRepository})
      : _chatBotRepository = chatBotRepository;

  Future<Result> call({required int categoryId}) async {
    return _chatBotRepository
        .getTableData(categoryId: categoryId)
        .then((tableData) => Result.success(tableData))
        .onError((Failure failure, _) => Result.failure(failure));
  }
}
