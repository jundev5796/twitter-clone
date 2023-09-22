import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/authentication/repos/authentication_repo.dart';
import 'package:twitter_clone/home/contents/users/models/image_post_model.dart';
import 'package:twitter_clone/home/contents/users/repos/image_post_repo.dart';
import 'package:twitter_clone/home/contents/users/view_models/users_view_model.dart';

class ImagePostViewModel extends AsyncNotifier<void> {
  late final ImagePostRepository _repository;
  String _enteredText = "";
  final List<String> _imageUrls = [];

  @override
  FutureOr<void> build() {
    _repository = ref.read(imagePostRepo);
  }

  void saveEnteredText(String text) {
    _enteredText = text;
  }

  Future<void> uploadImages(List<String> selectedImagePaths) async {
    _imageUrls.clear(); // Clear the list before adding new image URLs

    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;

    if (userProfile != null) {
      state = const AsyncValue.loading();

      state = await AsyncValue.guard(() async {
        final tasks = <Future<String>>[];
        for (final imagePath in selectedImagePaths) {
          final imageFile = File(imagePath);
          final task = _repository.uploadImageFile(imageFile, user!.uid);
          tasks.add(task.then((value) => value.ref.getDownloadURL()));
        }

        final List<String> imageUrls = await Future.wait(tasks);

        // Update the _imageUrls list with the downloaded URLs
        _imageUrls.addAll(imageUrls);

        final enteredText = _enteredText;
        print("Entered Text: $enteredText"); // Debug print

        await _repository.saveImage(ImageModel(
          creator: userProfile.nickname,
          uid: user!.uid,
          imageUrls: _imageUrls,
          text: _enteredText, // Use the local variable here
          likes: 0,
          replies: 0,
        ));
      });
    }
  }
}

final uploadImageProvider = AsyncNotifierProvider<ImagePostViewModel, void>(
  () => ImagePostViewModel(),
);
