import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ThreadsPost extends StatelessWidget {
  const ThreadsPost({
    super.key,
    required this.description,
    required this.time,
  });

  final String description;
  final String time;

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
                      description,
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
        Gaps.v5,
        Divider(thickness: 0.8, color: Colors.grey.shade300),
      ],
    );
  }
}
