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
                hintText: 'Date of Birth',
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
            const SizedBox(
              height: 400,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size10,
                  horizontal: Sizes.size20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Color.fromARGB(255, 229, 226, 226),
                    // color: Color(0xFFBFC3C6),
                    fontSize: Sizes.size16 + 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
