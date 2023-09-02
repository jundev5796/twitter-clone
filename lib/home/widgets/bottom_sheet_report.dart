import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ReportModal extends StatelessWidget {
  const ReportModal({super.key});

  @override
  Widget build(BuildContext context) {
    final tiles = <Widget>[
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Divider(
          color: Colors.white,
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0), // Adjust the gap size as needed
        child: ListTile(
          title: Text(
            "I just don't like it",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0), // Adjust the gap size as needed
        child: ListTile(
          title: Text(
            "It's unlawful content under NetzDG",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0), // Adjust the gap size as needed
        child: ListTile(
          title: Text(
            "It's spam",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0), // Adjust the gap size as needed
        child: ListTile(
          title: Text(
            "Hate speech or symbols",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0), // Adjust the gap size as needed
        child: ListTile(
          title: Text(
            "Nudity or sexual activity",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0), // Adjust the gap size as needed
        child: ListTile(
          title: Text(
            "Verbal abuse",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0), // Adjust the gap size as needed
        child: ListTile(
          title: Text(
            "Regular crashes",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Divider(
          color: Colors.white,
        ),
      ),
    ];

    final dividedTiles = ListTile.divideTiles(
      context: context,
      tiles: tiles,
      color: Colors.grey, // Color of the divider, optional
    ).toList();

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.73,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Sizes.size20,
          ),
          topRight: Radius.circular(
            Sizes.size20,
          ),
        ),
      ),
      child: Column(
        children: [
          Gaps.v10,
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 50.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          Gaps.v10,
          const Text(
            "Report",
            style: TextStyle(
              fontSize: Sizes.size20 + Sizes.size1,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.v10,
          Divider(
            color: Colors.grey.shade300,
          ),
          Expanded(
            // To make sure it takes the remaining space
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gaps.v4,
                  const ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Why are you reporting this thread?",
                          style: TextStyle(
                            fontSize: Sizes.size16 + Sizes.size2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gaps.v10,
                        Text(
                          "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizes.size16 + Sizes.size1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...dividedTiles,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
