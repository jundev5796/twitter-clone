import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/camera/camera_screen.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class WriteModal extends StatefulWidget {
  const WriteModal({super.key});

  @override
  State<WriteModal> createState() => _WriteModalState();
}

class _WriteModalState extends State<WriteModal> {
  final _controller = TextEditingController();
  bool _isTextFieldEmpty = true;

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

  void _onAttachTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        const Text(
                          "Jun",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextField(
                          controller: _controller,
                          maxLines: null,
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
                bottom: MediaQuery.of(context).viewInsets.bottom + Sizes.size8,
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
                    Text(
                      "Post",
                      style: TextStyle(
                        color: _isTextFieldEmpty
                            ? Colors.blue.shade200
                            : Colors.blue,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
