import 'package:messmatebot/domain/model/account/user.dart';

abstract class AccountDataSource {
  void saveUserInfo({required UserModel user});
}
