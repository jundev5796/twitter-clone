import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: InputDecoration(
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
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min, // Add this line
                  children: [
                    FaIcon(
                      FontAwesomeIcons.eyeSlash,
                      color: Colors.grey.shade500,
                      size: Sizes.size20,
                    ),
                  ],
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
