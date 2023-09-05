import 'package:flutter/material.dart';
import 'package:twitter_clone/home/contents/profile/widgets/threads_post.dart';

class TabThreads extends StatelessWidget {
  const TabThreads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ThreadsPost(
          description: "How are you guys doing this week?",
          time: "5h",
        ),
      ],
    );
  }
}
