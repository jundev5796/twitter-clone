import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        leading:
            const BackButton(color: Colors.black), // Custom back button color
        title: const Text(
          "Privacy",
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20,
          ),
        ),
      ),
    );
  }
}
