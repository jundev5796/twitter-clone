import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/contents/users/view_models/image_post_view_model.dart';
import 'package:twitter_clone/home/contents/users/view_models/users_view_model.dart';
import 'package:twitter_clone/home/contents/widgets/new_post_screen.dart';

class WriteModal extends ConsumerStatefulWidget {
  const WriteModal({super.key});

  @override
  ConsumerState<WriteModal> createState() => _WriteModalState();
}

class _WriteModalState extends ConsumerState<WriteModal> {
  final _controller = TextEditingController();
  bool _isTextFieldEmpty = true;
  final List<String> _selectedImagePaths = [];
  String _enteredText = "";
  bool _isSaving = false;

  void _onCancelTap() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTextFieldEmpty = _controller.text.isEmpty;
      });
    });
  }

  void _onAttachTap() async {
    final imagePicker = ImagePicker();
    final pickedImages = await imagePicker.pickMultiImage(
      imageQuality: 40,
    );

    if (pickedImages.isNotEmpty) {
      setState(() {
        _selectedImagePaths.addAll(pickedImages.map((image) => image.path));
      });
    }
  }

  void _onDeleteImage(int index) {
    setState(() {
      _selectedImagePaths.removeAt(index);
    });
  }

  void _saveEnteredTextAndImages() async {
    if (_isSaving) {
      // If the save operation is already in progress, return to prevent multiple calls
      return;
    }

    _isSaving =
        true; // Set the flag to indicate that the save operation is in progress

    final imagePostViewModel = ref.read(uploadImageProvider.notifier);

    // Check if there is entered text and at least one image is selected
    if (_enteredText.isNotEmpty && _selectedImagePaths.isNotEmpty) {
      // Call the uploadImages function to upload all selected images
      await imagePostViewModel.uploadImages(_selectedImagePaths);

      // Save entered text and other details
      imagePostViewModel.saveEnteredText(_enteredText);
    }

    _isSaving = false; // Reset the flag after the save operation is complete

    // Navigate to the ViewPostScreen after saving
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ViewPostScreen(),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(usersProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (data) => SingleChildScrollView(
            child: Container(
              height: 700,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size12,
                    ),
                    child: AppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 80.0,
                      title: const Text(
                        "New thread",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0.5,
                      leading: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 12,
                        ),
                        child: GestureDetector(
                          onTap: _onCancelTap,
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizes.size20,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size8,
                      horizontal: Sizes.size12,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              foregroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/69138182"),
                            ),
                            const SizedBox(height: Sizes.size8),
                            Container(
                              height: 80,
                              width: 2,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(height: Sizes.size8),
                            const CircleAvatar(
                              radius: 10,
                              foregroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/69138182"),
                            ),
                          ],
                        ),
                        const SizedBox(width: Sizes.size12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.nickname,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextField(
                                controller: _controller,
                                maxLines: null,
                                onChanged: (value) {
                                  setState(() {
                                    _enteredText =
                                        value; // Update the entered text
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Start a thread...",
                                  border: InputBorder.none,
                                ),
                              ),
                              Gaps.v8,
                              GestureDetector(
                                onTap: _onAttachTap,
                                child: FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              Gaps.v16,
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children:
                                    _selectedImagePaths.asMap().entries.map(
                                  (entry) {
                                    final int index = entry.key;
                                    final String imagePath = entry.value;
                                    return Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Image.file(
                                          File(imagePath),
                                          height:
                                              100, // Adjust the size as needed
                                          width:
                                              100, // Adjust the size as needed
                                          fit: BoxFit.cover,
                                        ),
                                        GestureDetector(
                                          onTap: () => _onDeleteImage(index),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Sizes.size12,
                      right: Sizes.size12,
                      bottom: MediaQuery.of(context).viewInsets.bottom +
                          Sizes.size8,
                      top: Sizes.size8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        bottom: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Anyone can reply",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: _isTextFieldEmpty
                                ? null
                                : _saveEnteredTextAndImages, // Call the function here
                            child: Text(
                              "Post",
                              style: TextStyle(
                                color: _isTextFieldEmpty
                                    ? Colors.blue.shade200
                                    : Colors.blue,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
