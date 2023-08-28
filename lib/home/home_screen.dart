import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/widgets/nav_tab.dart';
import 'package:twitter_clone/home/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.at,
          color: Colors.black,
          size: Sizes.size20 + 10,
        ),
        leadingWidth: 100,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 1,
              child: const SingleChildScrollView(child: Column()),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const PlaceholderWidget(text: "Search"),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: const PlaceholderWidget(text: "Tread"),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const PlaceholderWidget(text: "Notification"),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: const PlaceholderWidget(text: "Profile"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16,
            horizontal: Sizes.size12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
              ),
              NavTab(
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.penToSquare,
                onTap: () => _onTap(2),
              ),
              NavTab(
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                onTap: () => _onTap(3),
              ),
              NavTab(
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
