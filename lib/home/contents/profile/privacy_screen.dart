import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  static const String routeName = "privacy";
  static const String routeURL = "/settings/privacy";
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Privacy",
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size4,
              left: Sizes.size8,
              right: Sizes.size8,
            ),
            child: SwitchListTile.adaptive(
              title: const Text(
                "Privacy profile",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              value: _notifications,
              onChanged: _onNotificationsChanged,
              secondary: const FaIcon(
                FontAwesomeIcons.lock,
                color: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.at,
                color: Colors.black,
              ),
              title: Text(
                "Notifications",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bellSlash,
                color: Colors.black,
              ),
              title: Text(
                "Muted",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.eyeSlash,
                color: Colors.black,
              ),
              title: Text(
                "Hidden Words",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userGroup,
                color: Colors.black,
              ),
              title: Text(
                "Profiles you follow",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size20,
              ),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              title: Text(
                "Other privacy settings",
                style: TextStyle(
                  fontSize: Sizes.size18 + Sizes.size1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: Sizes.size20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
            ),
            child: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: Sizes.size18,
              ),
            ),
          ),
          Gaps.v16,
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleXmark,
                color: Colors.black,
              ),
              title: Text(
                "Profiles you follow",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: Sizes.size20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.thumbsUp,
                color: Colors.black,
              ),
              title: Text(
                "Hide likes",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: Sizes.size20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
