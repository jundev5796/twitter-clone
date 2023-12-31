import 'package:flutter/cupertino.dart';
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
  bool _showDatePicker = false;

  DateTime initialDate = DateTime.now();

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
        builder: (context) => ExperienceScreen(
          name: _name,
          email: _email,
          birthday: _birthday,
        ),
      ),
    );
  }

  bool _isEmailValid() {
    if (_email.isEmpty) return false;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regExp.hasMatch(_email);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_name.isEmpty ||
        _email.isEmpty ||
        !_isEmailValid() ||
        _birthday.isEmpty) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExperienceScreen(
          name: _name,
          email: _email,
          birthday: _birthday,
        ),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    setState(() {
      _birthday = textDate;
    });
  }

  void _toggleDatePicker() {
    setState(() {
      _showDatePicker = !_showDatePicker;
    });
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
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: _onSubmit,
                  autocorrect: false,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: _name.isEmpty
                              ? Colors.grey.shade400
                              : const Color(
                                  0xFF54B882,
                                ),
                        ),
                      ],
                    ),
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
                  onEditingComplete: _onSubmit,
                  autocorrect: false,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: _email.isEmpty || !_isEmailValid()
                              ? Colors.grey.shade400
                              : const Color(
                                  0xFF54B882,
                                ),
                        ),
                      ],
                    ),
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
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context)
                        .unfocus(); // Hide the keyboard if it's open
                    _toggleDatePicker();
                  },
                  child: TextField(
                    enabled: false,
                    controller: _birthdayController,
                    keyboardType: TextInputType.emailAddress,
                    onEditingComplete: _onSubmit,
                    autocorrect: false,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gaps.h20,
                          FaIcon(
                            FontAwesomeIcons.circleCheck,
                            color: _birthday.isEmpty
                                ? Colors.grey.shade400
                                : const Color(
                                    0xFF54B882,
                                  ),
                          ),
                        ],
                      ),
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
                ),
                Gaps.v10,
                Text(
                  'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 350,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: _onSubmit,
                    child: GestureDetector(
                      onTap: _onNextTap,
                      child: AnimatedContainer(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size10,
                          horizontal: Sizes.size20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _name.isNotEmpty &&
                                  _email.isNotEmpty &&
                                  _isEmailValid() &&
                                  _birthday.isNotEmpty
                              ? const Color(0xFF101318)
                              : Colors.grey,
                        ),
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 00),
                          style: TextStyle(
                            color: _name.isNotEmpty &&
                                    _email.isNotEmpty &&
                                    _isEmailValid() &&
                                    _birthday.isNotEmpty
                                ? Colors.white
                                : const Color.fromARGB(255, 229, 226, 226),
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
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _showDatePicker
            ? BottomAppBar(
                child: SizedBox(
                  height: 300,
                  child: CupertinoDatePicker(
                    maximumDate: initialDate,
                    initialDateTime: initialDate,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: _setTextFieldDate,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
