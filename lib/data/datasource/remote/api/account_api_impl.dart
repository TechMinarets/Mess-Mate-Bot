import 'package:messmatebot/data/datasource/remote/api/account_api.dart';
import 'package:messmatebot/data/datasource/remote/utils/api_client.dart';
import 'package:messmatebot/domain/model/account/user.dart';

class AccountApiImpl implements AccountApi {
  final ApiClient _client;
  static const String userApi = 'account/users/';

  AccountApiImpl({required ApiClient client}) : _client = client;

  @override
  void saveUserInfo({required UserModel user}) {
    print(user.name);
    _client.post(
      path: userApi,
      data: {
        "uuid": user.uuid,
        "name": user.name,
        "email": user.email,
        "profile_picture": user.profilePicture,
      },
      converter: (json) => json,
    );
  }
}
