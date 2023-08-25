import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/onboarding/interests_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTap() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                "You'll need a password",
                style: TextStyle(
                  fontSize: Sizes.size28 + 1.4,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v24,
              Text(
                "Make sure it's 8 characters or more.",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: Sizes.size16 + 2,
                ),
              ),
              Gaps.v44,
              TextField(
                controller: _passwordController,
                onEditingComplete: _onNextTap,
                autocorrect: false,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      const SizedBox(
                          width:
                              10), // Adjust this value to control the spacing between the icons
                      if (_isPasswordValid())
                        const FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: Colors.green,
                          size: Sizes.size20,
                        ),
                    ],
                  ),
                  hintText: "Password",
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
                cursorColor: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: GestureDetector(
                  onTap: isButtonEnabled ? _onNextTap : null,
                  child: AnimatedContainer(
                    duration: const Duration(
                        milliseconds:
                            300), // animation duration for the container
                    curve: Curves.easeOut, // easing for the container
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isButtonEnabled
                          ? const Color(0xFF101318)
                          : Colors.grey, // conditional color
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: Sizes.size2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedDefaultTextStyle(
                          style: TextStyle(
                            color: isButtonEnabled
                                ? Colors.white
                                : const Color.fromARGB(255, 229, 226, 226),
                            fontSize: Sizes.size16 + 3,
                            fontWeight: FontWeight.w700,
                          ),
                          duration: const Duration(
                              milliseconds:
                                  300), // animation duration for the text
                          // easing for the text
                          child: const Text('Next'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
