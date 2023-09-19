class UserProfileModel {
  final String username;
  final String nickname;
  final String bio;
  final String uid;
  // final bool hasAvatar;

  UserProfileModel({
    required this.username,
    required this.nickname,
    required this.bio,
    required this.uid,
    // required this.hasAvatar,
  });

  UserProfileModel.empty()
      : username = "",
        nickname = "",
        bio = "",
        uid = "";

  Map<String, String> toJson() {
    return {
      "username": username,
      "nickname": nickname,
      "bio": bio,
      "uid": uid,
    };
  }
}
