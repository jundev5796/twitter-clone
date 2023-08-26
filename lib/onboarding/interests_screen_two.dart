import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class InterestsScreenTwo extends StatefulWidget {
  const InterestsScreenTwo({super.key});

  @override
  State<InterestsScreenTwo> createState() => _InterestsScreenTwoState();
}

class _InterestsScreenTwoState extends State<InterestsScreenTwo> {
  void onInitialTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Color(0xFF4E98E9),
          size: Sizes.size20 + 10,
        ),
        leadingWidth: 100,
        leading: IconButton(
          onPressed: () => onInitialTap(context),
          icon: const Padding(
            padding:
                EdgeInsets.only(right: 40), // Adjust this value to your needs
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Color(0xFF101318),
            ),
          ),
        ),
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
              "Interests are used to personalize your experience and will be visible on your profile.",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: Sizes.size16 + 2,
              ),
            ),
            Gaps.v64,
          ],
        ),
      ),
    );
  }
}
