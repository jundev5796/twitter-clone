import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/widgets/auth_button.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v20,
              FaIcon(
                FontAwesomeIcons.twitter,
                color: Color(0xFF4E98E9),
                size: Sizes.size20 + 10,
              ),
              Gaps.v96,
              Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  color: Color(0xFF101318),
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthButton(
                  icon: FaIcon(FontAwesomeIcons.google),
                  text: "Continue with Google"),
              Gaps.v16,
              AuthButton(
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                  ),
                  text: "Continue with Apple"),
              Gaps.v14,
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 30, // This affects the spacing around the divider
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or"),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 30, // This affects the spacing around the divider
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16 + 1,
            horizontal: Sizes.size40,
          ),
          child: Row(
            children: [
              Text(
                'Have an account already?',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: Sizes.size10 + 5,
                ),
              ),
              Gaps.h5,
              Text(
                'Log in',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Sizes.size10 + 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
