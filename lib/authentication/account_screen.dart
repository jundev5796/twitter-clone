import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/experience_screen.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  String _name = "";
  String _email = "";
  String _birthday = "";

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });

    _birthdayController.addListener(() {
      setState(() {
        _birthday = _birthdayController.text;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void onInitialTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onNextTap() {
    if (_name.isEmpty || _email.isEmpty || _birthday.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ExperienceScreen(),
      ),
    );
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not valid";
    }
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Padding(
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
                  controller: _nameController,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
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
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email Address',
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
                  controller: _birthdayController,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
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
                  child: GestureDetector(
                    onTap: _onNextTap,
                    child: AnimatedContainer(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: _name.isEmpty ||
                                _email.isEmpty ||
                                _isEmailValid() != null ||
                                _birthday.isEmpty
                            ? Colors.grey
                            : const Color(0xFF101318),
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 00),
                        style: TextStyle(
                          color: _name.isEmpty ||
                                  _email.isEmpty ||
                                  _birthday.isEmpty
                              ? const Color.fromARGB(255, 229, 226, 226)
                              : Colors.white,
                          fontSize: Sizes.size16 + 2,
                        ),
                        child: const Text(
                          'Next',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
