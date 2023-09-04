import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.language,
            color: Colors.black,
            size: Sizes.size32,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.black,
                size: Sizes.size32,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.segment,
                color: Colors.black,
                size: Sizes.size32,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
