import 'package:messmatebot/data/datasource/remote/api/account_api.dart';
import 'package:messmatebot/data/repository/source/remote/account_data_source.dart';
import 'package:messmatebot/domain/model/account/user.dart';

class AccountDataSourceImpl extends AccountDataSource {
  final AccountApi _accountApi;

  AccountDataSourceImpl({
    required AccountApi accountApi,
  }) : _accountApi = accountApi;

  @override
  void saveUserInfo({required UserModel user}) {
    _accountApi.saveUserInfo(user: user);
  }
}
