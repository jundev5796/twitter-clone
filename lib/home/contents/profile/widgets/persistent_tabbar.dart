import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return const SizedBox(
      height: 50,
      child: TabBar(
        indicatorWeight: 0.8,
        labelPadding: EdgeInsets.only(
          bottom: Sizes.size4,
        ),
        tabs: [
          Text(
            "Threads",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size1,
            ),
          ),
          Text(
            "Replies",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
