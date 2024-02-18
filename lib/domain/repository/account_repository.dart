import 'package:messmatebot/domain/model/account/user.dart';

abstract class AccountRepository {
  void saveUserInfo({required UserModel user});
}
