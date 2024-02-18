import 'package:messmatebot/domain/model/account/user.dart';
import 'package:messmatebot/domain/repository/account_repository.dart';

class SaveUserInfoUseCase {
  final AccountRepository _accountRepository;

  SaveUserInfoUseCase({required AccountRepository accountRepository})
      : _accountRepository = accountRepository;

  void call({required UserModel user}) async {
    _accountRepository.saveUserInfo(user: user);
  }
}
