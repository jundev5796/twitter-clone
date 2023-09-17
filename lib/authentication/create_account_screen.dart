import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/authentication/login_screen.dart';
import 'package:twitter_clone/authentication/view_models/signup_view_model.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class CreateAccount extends ConsumerStatefulWidget {
  static const String routeName = "create_account";
  static const String routeURL = "/create_account";
  const CreateAccount({super.key});

  @override
  ConsumerState<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends ConsumerState<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  void _onSignUpTap() async {
    print("SignUp Button was tapped!");
    ref.read(signUpForm.notifier).state = {
      "email": _email,
      "password": _password,
    };
    await ref.read(signUpProvider.notifier).signUp(context);
  }

  void _onLoginTap(BuildContext context) async {
    context.pushNamed(LoginScreen.routeName);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5FAFE),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5FAFE),
          elevation: 0,
          title: Text(
            "English (US)",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: Sizes.size16,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gaps.v32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/threads-logo.svg',
                      width: 90,
                      height: 90,
                    ),
                  ],
                ),
                Gaps.v60,
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(Sizes.size6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size10,
                          horizontal: Sizes.size16,
                        ),
                        child: TextField(
                          controller: _emailController,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Mobile number or email",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: Sizes.size18,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Gaps.v16,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(Sizes.size6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size10,
                          horizontal: Sizes.size16,
                        ),
                        child: TextField(
                          controller: _passwordController,
                          autocorrect: false,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: Sizes.size18,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Gaps.v16,
                    TextButton(
                      onPressed: _onSignUpTap,
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF0c64E0),
                        backgroundColor: const Color(0xFF0c64E0),
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size20,
                          horizontal: Sizes.size16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.size6),
                          side: BorderSide(color: Colors.grey.shade400),
                        ),
                        minimumSize: const Size(double.infinity,
                            0), // This will stretch the button horizontally
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 270,
                    ),
                    TextButton(
                      onPressed: () => _onLoginTap(context),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFFF5FAFE),
                        backgroundColor: const Color(0xFFF5FAFE),
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size12,
                          horizontal: Sizes.size16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.size6),
                          side: BorderSide(color: Colors.grey.shade400),
                        ),
                        minimumSize: const Size(double.infinity,
                            0), // This will stretch the button horizontally
                      ),
                      child: const Text(
                        "Already have account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Gaps.v20,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.meta,
                          size: Sizes.size20,
                        ),
                        Gaps.h4,
                        Text(
                          "Meta",
                          style: TextStyle(
                            fontSize: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
