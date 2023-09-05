import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class RepliesPost extends StatelessWidget {
  const RepliesPost({
    super.key,
    required this.description,
    required this.time,
    required this.descriptionText,
    required this.repliesCount,
    required this.description2,
  });

  final String description;
  final String description2;
  final String time;
  final String descriptionText;
  final String repliesCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 10,
            left: 14,
            right: 14,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/69138182?v=4",
                    ),
                  ),
                  Gaps.v32,
                  Container(
                    height: 200, // Adjust this value to your needs
                    width: 1,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
              Gaps.h12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "jun_gamer",
                          style: TextStyle(
                            fontSize: Sizes.size16 + Sizes.size1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              time,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.h14,
                            const FaIcon(
                              FontAwesomeIcons.ellipsis,
                              size: Sizes.size18,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gaps.v4,
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: Sizes.size16 + Sizes.size1,
                      ),
                    ),
                    Gaps.v16,
                    Container(
                      padding: const EdgeInsets.all(
                        Sizes.size16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 12,
                                foregroundImage: NetworkImage(
                                  "https://pbs.twimg.com/profile_images/1403220838241865734/hb_gs8PD_400x400.jpg",
                                ),
                              ),
                              Gaps.h10,
                              const Text(
                                "geoffkeighley",
                                style: TextStyle(
                                  fontSize: Sizes.size16 + Sizes.size1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Gaps.h5,
                              Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.check,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gaps.v14,
                          Text(
                            descriptionText,
                            style: const TextStyle(
                              fontSize: Sizes.size16 + Sizes.size1,
                            ),
                          ),
                          Gaps.v20,
                          Text(
                            repliesCount,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gaps.v16,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.grey.shade700,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.comment,
                          color: Colors.grey.shade700,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.retweet,
                          color: Colors.grey.shade700,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 10,
            left: 14,
            right: 14,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 22,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/69138182?v=4",
                ),
              ),
              Gaps.h12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "jun_gamer",
                          style: TextStyle(
                            fontSize: Sizes.size16 + Sizes.size1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              time,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.h14,
                            const FaIcon(
                              FontAwesomeIcons.ellipsis,
                              size: Sizes.size18,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gaps.v4,
                    Text(
                      description2,
                      style: const TextStyle(
                        fontSize: Sizes.size16 + Sizes.size1,
                      ),
                    ),
                    Gaps.v16,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.grey.shade700,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.comment,
                          color: Colors.grey.shade700,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.retweet,
                          color: Colors.grey.shade700,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 0.8, color: Colors.grey.shade300),
      ],
    );
  }
}
