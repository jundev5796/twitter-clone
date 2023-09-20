class UserProfileModel {
  final String username;
  final String nickname;
  final String bio;
  final String uid;
  final bool hasAvatar;
  // final bool hasAvatar;

  UserProfileModel({
    required this.username,
    required this.nickname,
    required this.bio,
    required this.uid,
    required this.hasAvatar,
    // required this.hasAvatar,
  });

  UserProfileModel.empty()
      : username = "",
        nickname = "",
        bio = "",
        uid = "",
        hasAvatar = false;

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        nickname = json["nickname"],
        bio = json["bio"],
        uid = json["uid"],
        hasAvatar = json["hasAvatar"];

  Map<String, String> toJson() {
    return {
      "username": username,
      "nickname": nickname,
      "bio": bio,
      "uid": uid,
    };
  }
}
