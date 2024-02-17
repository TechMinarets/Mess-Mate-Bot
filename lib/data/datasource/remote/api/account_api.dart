import 'package:messmatebot/domain/model/account/user.dart';

abstract class AccountApi {
  void saveUserInfo({required UserModel user});
}
