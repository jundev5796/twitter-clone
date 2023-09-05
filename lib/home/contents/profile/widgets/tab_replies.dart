import 'package:flutter/material.dart';

class TabReplies extends StatelessWidget {
  const TabReplies({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/69138182?v=4",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
