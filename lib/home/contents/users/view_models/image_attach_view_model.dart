// import 'dart:async';
// import 'dart:io';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:twitter_clone/authentication/repos/authentication_repo.dart';
// import 'package:twitter_clone/home/contents/users/repos/user_repo.dart';

// class ImageAttachViewModel extends AsyncNotifier<void> {
//   late final UserRepository _repository;

//   @override
//   FutureOr<void> build() {
//     _repository = ref.read(userRepo);
//   }

//   Future<void> uploadAttachedImage(File file) async {
//     state = const AsyncValue.loading();
//     final fileName = ref.read(authRepo).user!.uid;
//     state = await AsyncValue.guard(
//       () async => await _repository.uploadAttachedImage(file, fileName),
//     );
//   }
// }

// final imageAttachProvider = AsyncNotifierProvider<ImageAttachViewModel, void>(
//   () => ImageAttachViewModel(),
// );
