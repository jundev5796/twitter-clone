import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<bool> followed = [];

  final List<Map<String, dynamic>> _lists = [
    {
      "avatar": "https://avatars.githubusercontent.com/u/3612017?v=4",
      "name": "nico",
      "subtitle": "Nicolás Serrano Arévalo",
      "followers": "789K followers",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/1?v=4",
      "name": "kevinmiller",
      "subtitle": "Kevin Miller",
      "followers": "26.6K followers",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/2?v=4",
      "name": "ethanwaterman",
      "subtitle": "Ethan Waterman",
      "followers": "130K followers",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/3?v=4",
      "name": "elliotreed",
      "subtitle": "Elliot Reed",
      "followers": "69.2K followers",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/4?v=4",
      "name": "davidgibson",
      "subtitle": "David Gibson",
      "followers": "237K followers",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/5?v=4",
      "name": "sarahowens",
      "subtitle": "Sarah Owens",
      "followers": "53.2K followers",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/6?v=4",
      "name": "ericshaw",
      "subtitle": "Eric Shaw",
      "followers": "498K followers",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/7?v=4",
      "name": "brianjackson",
      "subtitle": "Brian Jackson",
      "followers": "92.4K followers",
    },
    {
      "avatar": "https://avatars.githubusercontent.com/u/20?v=4",
      "name": "johnvanbyssum",
      "subtitle": "Jonathan Van Byssum",
      "followers": "92.4K followers",
    },
  ];

  @override
  void initState() {
    super.initState();
    // Initialize all users as not followed
    followed = List<bool>.filled(_lists.length, false);
  }

  @override
  Widget build(BuildContext context) {
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
                    "Search",
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  CupertinoSearchTextField(),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: _lists.asMap().entries.map((entry) {
            int idx = entry.key;
            var list = entry.value;

            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    foregroundImage: NetworkImage(
                      list["avatar"],
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: Sizes.size2),
                        child: Row(
                          children: [
                            Text(
                              list["name"],
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gaps.h2,
                            Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.check,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        list["subtitle"],
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        list["followers"],
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                        ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        followed[idx] = !followed[idx];
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: followed[idx]
                              ? Colors.grey.shade300
                              : Colors.grey.shade300,
                        ),
                        color: followed[idx] ? Colors.white : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        followed[idx] ? "Unfollow" : "Follow",
                        style: TextStyle(
                          color: followed[idx] ? Colors.grey : Colors.black,
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 80, right: 16),
                  child: Divider(thickness: 1.0),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
