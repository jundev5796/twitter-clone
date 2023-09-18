import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/authentication/repos/authentication_repo.dart';
import 'package:twitter_clone/camera/repos/image_repo.dart';

class UploadImageViewModel extends AsyncNotifier<void> {
  late final ImageRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(imageRepo);
  }

  Future<void> uploadImage(File image) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final task = await _repository.uploadImageFile(
        image,
        user!.uid,
      );
      if (task.metadata != null) {
        await _repository.saveImage();
      }
    });
  }
}
