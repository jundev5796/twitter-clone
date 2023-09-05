import 'package:flutter/material.dart';
import 'package:twitter_clone/home/contents/profile/widgets/threads_image_post.dart';
import 'package:twitter_clone/home/contents/profile/widgets/threads_post.dart';

class TabThreads extends StatelessWidget {
  const TabThreads({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ThreadsPost(
            description: "How are you guys doing this week?",
            time: "5h",
          ),
          ThreadsImagePost(
            description:
                "Excited for Game Awards 2023! Which game will win GOTY?",
            time: "6h",
            descriptionText:
                "Mark your calenders for Game Awards 2023 which premiers December 8 and vote for your favorite game now!",
            descriptionImg:
                "https://media.npr.org/assets/img/2022/12/07/tga_key_art_3-copy_wide-797f8719c005e005ce7c1b8f575044f1a12ebe25-s800-c85.webp",
          ),
          ThreadsImagePost(
            description: "So many good games this year!",
            time: "8h",
            descriptionText:
                "A list of candidates for this years Game Awards! What is your pick?",
            descriptionImg:
                "https://staticg.sportskeeda.com/editor/2023/06/286fe-16871091701133-1920.jpg?w=840",
          ),
          ThreadsPost(
            description:
                "Enjoying Ys 8 at the moment. What are you guys playing right now?",
            time: "1d",
          ),
          ThreadsPost(
            description: "Hope you guys have another great week!",
            time: "3d",
          ),
        ],
      ),
    );
  }
}
