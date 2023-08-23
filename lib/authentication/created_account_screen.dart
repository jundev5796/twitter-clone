import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/onBoarding/home_screen.dart';

class CreatedAccountScreen extends StatefulWidget {
  final String? name;
  final String? email;
  final String? birthday;

  const CreatedAccountScreen({
    Key? key,
    this.name,
    this.email,
    this.birthday,
  }) : super(key: key);

  @override
  State<CreatedAccountScreen> createState() => _CreatedAccountScreenState();
}

class _CreatedAccountScreenState extends State<CreatedAccountScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController birthdayController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    birthdayController = TextEditingController(text: widget.birthday);
  }

  void onInitialTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    birthdayController.dispose();
    super.dispose();
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
              "Create your Account",
              style: TextStyle(
                fontSize: Sizes.size28 + 2,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v44,
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.h20,
                    FaIcon(
                      FontAwesomeIcons.circleCheck,
                      color: Color(
                        0xFF54B882,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.h20,
                    FaIcon(
                      FontAwesomeIcons.circleCheck,
                      color: Color(
                        0xFF54B882,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              controller: birthdayController,
              decoration: const InputDecoration(
                labelText: 'Birthday',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.h20,
                    FaIcon(
                      FontAwesomeIcons.circleCheck,
                      color: Color(
                        0xFF54B882,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 270,
            ),
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
                    text: 'Terms of Service ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: Sizes.size14,
                    ), // Adjust the color as needed
                  ),
                  TextSpan(
                    text: 'and',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: Sizes.size14,
                    ),
                  ),
                  const TextSpan(
                    text: ' Privacy Policy',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: Sizes.size14,
                    ), // Adjust the color as needed
                  ),
                  TextSpan(
                    text: ', including ',
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
                    text:
                        '. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. ',
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
                  TextSpan(
                    text:
                        '. Others will be able to find you by email or phone number, when provided, unless you choose otherwise ',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: Sizes.size14,
                    ),
                  ),
                  const TextSpan(
                    text: 'here',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: Sizes.size14,
                    ), // Adjust the color as needed
                  ),
                  TextSpan(
                    text: '.',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: Sizes.size14,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v16,
            FractionallySizedBox(
              widthFactor: 1,
              child: GestureDetector(
                onTap: () => _onSignUpTap(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size16,
                    horizontal: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: Sizes.size2,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
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
