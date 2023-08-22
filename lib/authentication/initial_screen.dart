import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/account_screen.dart';
import 'package:twitter_clone/authentication/widgets/auth_button.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  void _onAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v20,
              const FaIcon(
                FontAwesomeIcons.twitter,
                color: Color(0xFF4E98E9),
                size: Sizes.size20 + 10,
              ),
              const SizedBox(
                height: 120,
              ),
              const Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  color: Color(0xFF101318),
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 130,
              ),
              const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.google),
                  text: "Continue with Google"),
              Gaps.v16,
              const AuthButton(
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                  ),
                  text: "Continue with Apple"),
              Gaps.v14,
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade700,
                      height: 30, // This affects the spacing around the divider
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "or",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade700,
                      height: 30, // This affects the spacing around the divider
                    ),
                  ),
                ],
              ),
              FractionallySizedBox(
                widthFactor: 1,
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
                  child: GestureDetector(
                    onTap: () => _onAccountTap(context),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Gaps.h16,
                        Text(
                          'Create account',
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
              Gaps.v40,
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
                              fontSize: Sizes.size16 + 1,
                            ),
                          ),
                          const TextSpan(
                            text: 'Terms',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: Sizes.size16 + 1,
                            ), // Adjust the color as needed
                          ),
                          TextSpan(
                            text: ',',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: Sizes.size16 + 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v4,
              FractionallySizedBox(
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(), // default text style
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: Sizes.size16 + 1,
                            ),
                          ),
                          TextSpan(
                            text: ', and ',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: Sizes.size16 + 1,
                            ),
                          ),
                          const TextSpan(
                            text: 'Cookie Use',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: Sizes.size16 + 1,
                            ), // Adjust the color as needed
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: Sizes.size16 + 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
