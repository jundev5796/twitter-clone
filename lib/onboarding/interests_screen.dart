import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Color(0xFF4E98E9),
          size: Sizes.size20 + 10,
        ),
        leadingWidth: 100,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v20,
            const Text(
              "What do you want to see on Twitter",
              style: TextStyle(
                fontSize: Sizes.size28 + 2,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v24,
            Text(
              "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: Sizes.size16 + 2,
              ),
            ),
            Gaps.v44,
          ],
        ),
      ),
    );
  }
}
