import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v20,
              Icon(
                FontAwesomeIcons.twitter,
                color: Color(0xFF4E98E9),
                size: Sizes.size20 + 10,
              ),
              Gaps.v80,
              Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  color: Color(0xFF101318),
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
