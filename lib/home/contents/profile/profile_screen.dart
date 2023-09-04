import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
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
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Jun",
                            style: TextStyle(
                              fontSize: Sizes.size28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "jun_gamer",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.size16 + Sizes.size1,
                                ),
                              ),
                              Gaps.h4,
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size8,
                                  horizontal: Sizes.size8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F6F6),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Text(
                                  "threads.net",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16.0),
                      width: 65,
                      height: 65,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                              "https://avatars.githubusercontent.com/u/69138182?v=4"),
                        ),
                      ),
                    ),
                  ],
                ),
                Gaps.v14,
                const Row(
                  children: [
                    Text(
                      "Game enthusiast!",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
                Gaps.v24,
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      foregroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/1?v=4"),
                    ),
                    const CircleAvatar(
                      radius: 12,
                      foregroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/3612017?v=4"),
                    ),
                    Gaps.h14,
                    Text(
                      "2 followers",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: Sizes.size18,
                      ),
                    ),
                  ],
                ),
                Gaps.v32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size44,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Edit profile",
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size44,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Share profile",
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
