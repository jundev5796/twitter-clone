class ImageModel {
  final String creator;
  final String uid;
  final List<String> imageUrls;
  final String text;
  final int likes;
  final int replies;

  ImageModel({
    required this.creator,
    required this.uid,
    required this.imageUrls,
    required this.text,
    required this.likes,
    required this.replies,
  });

  Map<String, dynamic> toJson() {
    return {
      "creator": creator,
      "uid": uid,
      "imageUrls": imageUrls,
      "text": text,
      "likes": likes,
      "replies": replies,
    };
  }
}
