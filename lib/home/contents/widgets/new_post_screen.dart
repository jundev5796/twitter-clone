import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/widgets/multi_avatar.dart';

class ViewPostScreen extends StatelessWidget {
  const ViewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // You can use any icon you prefer
          onPressed: () {
            Navigator.of(context)
                .pop(); // This will pop the current screen and go back
          },
        ),
        title: const Text(
          "Post",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
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
                                    "Anonymous",
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
                                        color: Colors
                                            .white, // or desired icon color
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
                                    onTap: () {},
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
                                "This challenge was hard...",
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
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                // List of image URLs
                                List<String> urls = [
                                  "assets/icons/waterfall-ios.png",
                                ];

                                return Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // This will give a slight rounded corner
                                    child: Image.asset(
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
            ],
          ),
        ),
      ),
    );
  }
}
