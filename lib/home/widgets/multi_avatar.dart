import 'package:flutter/material.dart';

class MultiAvatar extends StatelessWidget {
  const MultiAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 40, // Adjust based on total width including all overlaps
        height: 60, // Adjust based on your CircleAvatar's radius
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/1?v=4"),
              ),
            ),
            Positioned(
              left: 10, // Adjust this for more or less overlap
              child: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/2?v=4"),
              ),
            ),
            Positioned(
              left: 20, // Adjust this for more or less overlap
              child: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/3?v=4"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
