import 'package:messmatebot/data/repository/source/remote/account_data_source.dart';
import 'package:messmatebot/domain/model/account/user.dart';
import 'package:messmatebot/domain/repository/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountDataSource _accountDataSource;

  AccountRepositoryImpl({
    required AccountDataSource accountDataSource,
  }) : _accountDataSource = accountDataSource;

  @override
  void saveUserInfo({required UserModel user}) {
    _accountDataSource.saveUserInfo(user: user);
  }
}
