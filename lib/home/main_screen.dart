import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/contents/home_screen.dart';
import 'package:twitter_clone/home/widgets/nav_tab.dart';
import 'package:twitter_clone/home/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/icons/threads-icon.svg',
          width: 40,
          height: 40,
        ),
        leadingWidth: 100,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
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
