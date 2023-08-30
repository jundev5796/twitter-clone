import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/widgets/bottom_sheet.dart';
import 'package:twitter_clone/home/widgets/multi_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onBottomSheetsTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const BottomSheetModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size20,
        horizontal: Sizes.size20,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/69138182"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Center(
                                child: FaIcon(FontAwesomeIcons.plus,
                                    size: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Container(
                        height: 225,
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      Gaps.v10,
                      const MultiAvatar(),
                    ],
                  ),
                  Gaps.h10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Jun",
                                  style: TextStyle(
                                    fontSize: Sizes.size16 + 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.h6,
                                Container(
                                  width: 15, // or desired size
                                  height: 15, // or desired size
                                  decoration: const BoxDecoration(
                                    color: Colors.blue, // or desired color
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.check,
                                      size: 12,
                                      color:
                                          Colors.white, // or desired icon color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "2m",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                Gaps.h20,
                                GestureDetector(
                                  onTap: () => _onBottomSheetsTap(context),
                                  child: const Text(
                                    "···",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gaps.v4,
                        const Row(
                          children: [
                            Text(
                              "Games coming out on September!",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v10,
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              // List of image URLs
                              List<String> urls = [
                                "https://pbs.twimg.com/media/F3907eOWkAINvi3.jpg",
                                "https://images5.alphacoders.com/132/1324754.png",
                                "https://images5.alphacoders.com/131/1318376.jpeg",
                                "https://wallpapercave.com/wp/wp12433416.jpg",
                                "https://cdn.cloudflare.steamstatic.com/steam/apps/1971870/capsule_616x353.jpg?t=1691778864",
                              ];

                              return Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // This will give a slight rounded corner
                                  child: Image.network(
                                    urls[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Gaps.v16,
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.comment,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.retweet,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.paperPlane,
                              color: Colors.grey.shade800,
                            ),
                          ],
                        ),
                        Gaps.v20,
                        Text(
                          "36 replies · 391 likes",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/69138182"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Center(
                                child: FaIcon(FontAwesomeIcons.plus,
                                    size: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Container(
                        height: 35,
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      Gaps.v10,
                      const MultiAvatar(),
                    ],
                  ),
                  Gaps.h10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Jun",
                                  style: TextStyle(
                                    fontSize: Sizes.size16 + 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.h6,
                                Container(
                                  width: 15, // or desired size
                                  height: 15, // or desired size
                                  decoration: const BoxDecoration(
                                    color: Colors.blue, // or desired color
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.check,
                                      size: 12,
                                      color:
                                          Colors.white, // or desired icon color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "2h",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                Gaps.h20,
                                const Text(
                                  "···",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gaps.v4,
                        const Row(
                          children: [
                            Text(
                              "What are you guys playing right now?",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v16,
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.comment,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.retweet,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.paperPlane,
                              color: Colors.grey.shade800,
                            ),
                          ],
                        ),
                        Gaps.v20,
                        Text(
                          "23 replies · 74 likes",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/69138182"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Center(
                                child: FaIcon(FontAwesomeIcons.plus,
                                    size: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Container(
                        height: 215,
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      Gaps.v10,
                      const MultiAvatar(),
                    ],
                  ),
                  Gaps.h10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Jun",
                                  style: TextStyle(
                                    fontSize: Sizes.size16 + 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.h6,
                                Container(
                                  width: 15, // or desired size
                                  height: 15, // or desired size
                                  decoration: const BoxDecoration(
                                    color: Colors.blue, // or desired color
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.check,
                                      size: 12,
                                      color:
                                          Colors.white, // or desired icon color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "3h",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                Gaps.h20,
                                const Text(
                                  "···",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gaps.v4,
                        const Row(
                          children: [
                            Text(
                              "Which game will win GOTY for 2023?",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v10,
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              // List of image URLs
                              List<String> urls = [
                                "https://thegameawards.com/share-2022.jpg?1693267200068?1693267200069",
                              ];

                              return Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // This will give a slight rounded corner
                                  child: Image.network(
                                    urls[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Gaps.v16,
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.comment,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.retweet,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.paperPlane,
                              color: Colors.grey.shade800,
                            ),
                          ],
                        ),
                        Gaps.v20,
                        Text(
                          "53 replies · 437 likes",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/69138182"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Center(
                                child: FaIcon(FontAwesomeIcons.plus,
                                    size: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Container(
                        height: 35,
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      Gaps.v10,
                      const MultiAvatar(),
                    ],
                  ),
                  Gaps.h10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Jun",
                                  style: TextStyle(
                                    fontSize: Sizes.size16 + 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.h6,
                                Container(
                                  width: 15, // or desired size
                                  height: 15, // or desired size
                                  decoration: const BoxDecoration(
                                    color: Colors.blue, // or desired color
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.check,
                                      size: 12,
                                      color:
                                          Colors.white, // or desired icon color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "5h",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                Gaps.h20,
                                const Text(
                                  "···",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gaps.v4,
                        const Row(
                          children: [
                            Text(
                              "Happy Friday!",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v16,
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.comment,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.retweet,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.paperPlane,
                              color: Colors.grey.shade800,
                            ),
                          ],
                        ),
                        Gaps.v20,
                        Text(
                          "37 replies · 58 likes",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/69138182"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Center(
                                child: FaIcon(FontAwesomeIcons.plus,
                                    size: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Container(
                        height: 35,
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      Gaps.v10,
                      const MultiAvatar(),
                    ],
                  ),
                  Gaps.h10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Jun",
                                  style: TextStyle(
                                    fontSize: Sizes.size16 + 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.h6,
                                Container(
                                  width: 15, // or desired size
                                  height: 15, // or desired size
                                  decoration: const BoxDecoration(
                                    color: Colors.blue, // or desired color
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.check,
                                      size: 12,
                                      color:
                                          Colors.white, // or desired icon color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "7h",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                Gaps.h20,
                                const Text(
                                  "···",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gaps.v4,
                        const Row(
                          children: [
                            Text(
                              "Vote for your favorite game on GOTY!",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v16,
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.comment,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.retweet,
                              color: Colors.grey.shade800,
                            ),
                            Gaps.h16,
                            FaIcon(
                              FontAwesomeIcons.paperPlane,
                              color: Colors.grey.shade800,
                            ),
                          ],
                        ),
                        Gaps.v20,
                        Text(
                          "82 replies · 109 likes",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
