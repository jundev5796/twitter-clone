// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:twitter_clone/home/contents/users/view_models/image_attach_view_model.dart';

// class AttachImage extends ConsumerWidget {
//   const AttachImage({super.key});

//   Future<void> _onAttachTap(WidgetRef ref) async {
//     try {
//       final xfile = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//         imageQuality: 40,
//         maxHeight: 150,
//         maxWidth: 150,
//       );
//       if (xfile != null) {
//         final file = File(xfile.path);
//         ref.read(imageAttachProvider.notifier).uploadAttachedImage(file);
//       }
//     } catch (e) {
//       print('Error attaching image: $e');
//       // Handle the error gracefully, for example, show a snackbar or alert dialog.
//     }
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isLoading = ref.watch(imageAttachProvider).isLoading;
//     return GestureDetector(
//       onTap: isLoading ? null : () => _onAttachTap(ref),
//       child: FaIcon(
//         FontAwesomeIcons.paperclip,
//         color: Colors.grey.shade400,
//       ),
//     );
//   }
// }
