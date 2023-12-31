import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/repos/authentication_repo.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/contents/settings/view_models/darkmode_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  static const String routeName = "settings";
  static const String routeURL = "/settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading:
            const BackButton(color: Colors.black), // Custom back button color
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20,
          ),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: Sizes.size4,
              left: Sizes.size8,
              right: Sizes.size8,
            ),
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userPlus,
                color: Colors.black,
              ),
              title: Text(
                "Follow and invite friends",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bell,
                color: Colors.black,
              ),
              title: Text(
                "Notifications",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.lock,
                  color: Colors.black,
                ),
                title: Text(
                  "Privacy",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.black,
              ),
              title: Text(
                "Account",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.black,
              ),
              title: Text(
                "Help",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            child: ListTile(
              leading: Icon(
                Icons.info_outline_rounded,
                color: Colors.black,
              ),
              title: Text(
                "About",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
            ),
          ),
          SwitchListTile.adaptive(
            value: ref.watch(darkmodeConfigProvider).darkmode,
            onChanged: (value) =>
                ref.read(darkmodeConfigProvider.notifier).enableDarkMode(value),
            title: const Text("Dark Mode"),
            subtitle: const Text("Enable Dark Mode"),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              "Log Out",
              style: TextStyle(
                color: Colors.blue,
                fontSize: Sizes.size18,
              ),
            ),
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => ref.read(authRepo).signOut(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// void _onPrivacyTap() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => const PrivacyScreen(),
//       ),
//     );
//   }
