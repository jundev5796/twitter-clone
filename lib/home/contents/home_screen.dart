import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/widgets/multi_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size20,
        horizontal: Sizes.size20,
      ),
      child: IntrinsicHeight(
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
                  height: 245,
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
                                color: Colors.white, // or desired icon color
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
                        "Games coming out on September!",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v10,
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                          ), // spacing between images
                          child: Row(
                            children: [
                              Image.network(
                                "https://pbs.twimg.com/media/F3907eOWkAINvi3.jpg",
                                fit: BoxFit.cover,
                              ),
                              Gaps.h10,
                              Image.network(
                                "https://images5.alphacoders.com/132/1324754.png",
                                fit: BoxFit.cover,
                              ),
                              Gaps.h10,
                              Image.network(
                                "https://images5.alphacoders.com/131/1318376.jpeg",
                                fit: BoxFit.cover,
                              ),
                              Gaps.h10,
                              Image.network(
                                "https://wallpapercave.com/wp/wp12433416.jpg",
                                fit: BoxFit.cover,
                              ),
                              Gaps.h10,
                              Image.network(
                                "https://cdn.cloudflare.steamstatic.com/steam/apps/1971870/capsule_616x353.jpg?t=1691778864",
                                fit: BoxFit.cover,
                              ),
                            ],
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
    );
  }
}
