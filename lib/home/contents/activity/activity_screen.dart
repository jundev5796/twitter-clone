import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  final tabs = [
    "All",
    "Replies",
    "Mentions",
    "Followers",
    "Verified",
  ];

  final List<Map<String, dynamic>> _lists = [
    {
      "avatar": "https://avatars.githubusercontent.com/u/3612017?v=4",
      "iconData": FontAwesomeIcons.solidHeart, // store the icon data
      "name": "nico",
      "time": "4h",
      "subtitle": "Mentioned you",
      "description":
          "Here's a thread you should follow if you love botany @nico",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/1?v=4",
      "iconData": FontAwesomeIcons.solidHeart, // store the icon data
      "name": "kevinmiller",
      "time": "4h",
      "subtitle": "Liked your post",
      "description": "You have an awesome content!",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/2?v=4",
      "iconData": FontAwesomeIcons.solidHeart, // store the icon data
      "name": "ethanwaterman",
      "time": "4h",
      "subtitle": "Liked your post",
      "description": "I like your game collection!",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/3?v=4",
      "iconData": FontAwesomeIcons.solidHeart, // store the icon data
      "name": "elliotreed",
      "time": "4h",
      "subtitle": "Liked your post",
      "description": "Would you be interested in a collab project?",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/4?v=4",
      "iconData": FontAwesomeIcons.solidHeart, // store the icon data
      "name": "davidgibson",
      "time": "4h",
      "subtitle": "Liked your post",
      "description": "Definitely agree with you :)",
    },
  ];

  TabController? _tabController;

  int _selectedTabIndex = 0; // To track which tab is currently selected.

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController?.addListener(() {
      if (_tabController!.indexIsChanging) {
        setState(() {
          _selectedTabIndex = _tabController!.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
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
                      fontSize: 32, // Using a static value for demo
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isDarkMode ? Colors.grey.shade800 : Colors.black,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              for (int i = 0; i < tabs.length; i++)
                SizedBox(
                  width: 120,
                  child: Tab(
                    child: Text(
                      tabs[i],
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: Sizes.size20,
        ),
        child: TabBarView(
          controller: _tabController,
          children: tabs.map((tab) {
            if (tab == "All") {
              return ListView.builder(
                itemCount: _lists.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: index == _lists.length - 1 ? Sizes.size18 : 8,
                        ),
                        child: ListTile(
                          leading: Stack(
                            children: [
                              CircleAvatar(
                                radius: 30, // increased size for main avatar
                                foregroundImage: NetworkImage(
                                  _lists[index]["avatar"],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 2), // white border
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: const Color(0xFFEA3378),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          2), // This will create the gap
                                      child: FaIcon(
                                        _lists[index]["iconData"],
                                        size: 10, // adjust as needed
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    _lists[index]["name"],
                                    style: const TextStyle(
                                      fontSize: Sizes.size18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Gaps.h4,
                                  Text(
                                    _lists[index]["time"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: Sizes.size18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  height:
                                      5.0), // This is the gap between title and subtitle
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _lists[index]["subtitle"],
                                style: const TextStyle(
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      5.0), // Gap between the original subtitle and the new text
                              Text(
                                _lists[index]["description"],
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  color: isDarkMode
                                      ? Colors.grey.shade600
                                      : Colors.black,
                                ),
                              ),
                              Gaps.v10,
                              if (index != _lists.length - 1) const Divider()
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: 28),
                ),
              );
            }
          }).toList(),
        ),
      ),
    );
  }
}
