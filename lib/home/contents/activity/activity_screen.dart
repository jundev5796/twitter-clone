import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: const SizedBox.shrink(),
            titleSpacing: 0,
            flexibleSpace: const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Activity",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Replies",
                ),
                Tab(
                  text: "Mentions",
                ),
                Tab(
                  text: "Followers",
                ),
                Tab(
                  text: "Verified",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
