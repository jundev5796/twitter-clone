import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v20,
            const Text(
              "Create your Account",
              style: TextStyle(
                fontSize: Sizes.size28 + 2,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v44,
            TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: const TextStyle(
                  fontSize: Sizes.size16 + 2,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            Gaps.v40,
            TextField(
              decoration: InputDecoration(
                hintText: 'Phone Number or Email Address',
                hintStyle: const TextStyle(
                  fontSize: Sizes.size16 + 2,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            Gaps.v40,
            TextField(
              decoration: InputDecoration(
                hintText: 'Date of birth',
                hintStyle: const TextStyle(
                  fontSize: Sizes.size16 + 2,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
