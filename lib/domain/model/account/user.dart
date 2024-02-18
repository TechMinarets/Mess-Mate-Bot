class UserModel {
  final String uuid;
  final String name;
  final String email;
  final String? profilePicture;

  UserModel({
    required this.uuid,
    required this.name,
    required this.email,
    required this.profilePicture,
  });
}
