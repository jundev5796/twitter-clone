import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/home/contents/users/models/image_post_model.dart';

class ImagePostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  UploadTask uploadImageFile(File image, String uid) {
    final fileRef = _storage.ref().child(
          "/post/$uid/${DateTime.now().millisecondsSinceEpoch}}",
        );
    return fileRef.putFile(image);
  }

  Future<void> saveImage(ImageModel data) async {
    await _db.collection("images").add(data.toJson());
  }
}

final imagePostRepo = Provider((ref) => ImagePostRepository());
