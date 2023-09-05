import 'package:flutter/material.dart';
import 'package:twitter_clone/home/contents/profile/widgets/replies_post.dart';

class TabReplies extends StatelessWidget {
  const TabReplies({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          RepliesPost(
            description: "Cannot wait!",
            description2: "My name is Jun Mk.2",
            descriptionText:
                "Are you excited for this years GOTY? Tell me how you feel!",
            repliesCount: "256 replies",
            time: "5h",
          ),
          RepliesPost(
            description: "Cannot wait!",
            description2: "My name is Jun Mk.2",
            descriptionText:
                "Are you excited for this years GOTY? Tell me how you feel!",
            repliesCount: "256 replies",
            time: "5h",
          ),
          RepliesPost(
            description: "Cannot wait!",
            description2: "My name is Jun Mk.2",
            descriptionText:
                "Are you excited for this years GOTY? Tell me how you feel!",
            repliesCount: "256 replies",
            time: "5h",
          ),
        ],
      ),
    );
  }
}
