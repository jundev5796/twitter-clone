import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  void onInitialTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Color(0xFF4E98E9),
          size: Sizes.size20 + 10,
        ),
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () => onInitialTap(context),
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Color(0xFF101318),
              fontSize: Sizes.size16 + 2,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 0,
      ),
    );
  }
}
