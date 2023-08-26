import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(
            fontSize: Sizes.size72,
          ),
        ),
      ),
    );
  }
}
