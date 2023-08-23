import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/created_account_screen.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  bool _isToggled = false; // To keep track of the toggle state

  void onInitialTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onCreatedAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreatedAccountScreen(),
      ),
    );
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v20,
            const Text(
              "Customize your experience",
              style: TextStyle(
                color: Color(0xFF101318),
                fontSize: Sizes.size28 + 2,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v28,
            const Text(
              'Track where you see Twitter content across the web',
              style: TextStyle(
                color: Color(0xFF101318),
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  // Use Flexible so that the text won't take more than half space even if it's very long
                  child: Text(
                    'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.',
                    style: TextStyle(
                      color: Color(0xFF101318),
                      fontSize: Sizes.size16 + 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Switch(
                  value: _isToggled,
                  onChanged: (bool value) {
                    setState(
                      () {
                        _isToggled = value;
                      },
                    );
                  },
                ),
              ],
            ),
            Gaps.v28,
            FractionallySizedBox(
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(), // default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: 'By signing up, you agree to our ',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        const TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: Sizes.size14,
                          ), // Adjust the color as needed
                        ),
                        TextSpan(
                          text: ',',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        const TextSpan(
                          text: ' Privacy',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: Sizes.size14,
                          ), // Adjust the color as needed
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FractionallySizedBox(
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(), // default text style
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Policy',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: Sizes.size14,
                          ), // Adjust the color as needed
                        ),
                        TextSpan(
                          text: ', and ',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        const TextSpan(
                          text: 'Cookie Use',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: Sizes.size14,
                          ), // Adjust the color as needed
                        ),
                        TextSpan(
                          text: '. Twitter may use your',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.size14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FractionallySizedBox(
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(), // default text style
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'contact information, including your email address',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.size14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FractionallySizedBox(
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(), // default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: 'and phone number for purposes outlined in our',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.size14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FractionallySizedBox(
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(), // default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Privacy Policy. ',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        const TextSpan(
                          text: 'Learn more',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: Sizes.size14,
                          ), // Adjust the color as needed
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: GestureDetector(
                onTap: () => _onCreatedAccountTap(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size16,
                    horizontal: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF101318),
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: Sizes.size2,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gaps.h16,
                      Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16 + 3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
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
