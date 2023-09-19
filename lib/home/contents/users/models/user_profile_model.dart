class UserProfileModel {
  final String username;
  final String nickname;
  final String uid;
  // final bool hasAvatar;

  UserProfileModel({
    required this.username,
    required this.nickname,
    required this.uid,
    // required this.hasAvatar,
  });

  UserProfileModel.empty()
      : username = "",
        nickname = "",
        uid = "";
}
