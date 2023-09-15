import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/contents/activity/activity_screen.dart';
import 'package:twitter_clone/home/contents/home_screen.dart';
import 'package:twitter_clone/home/contents/profile/profile_screen.dart';
import 'package:twitter_clone/home/contents/search/search_screen.dart';
import 'package:twitter_clone/home/contents/widgets/write_modal.dart';
import 'package:twitter_clone/home/widgets/nav_tab.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/utils.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "mainScreen";

  final String tab;

  const MainScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  final List<String> _tabs = [
    "home",
    "search",
    "xxxx",
    "activity",
    "profile",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    // final GoRouter router = GoRouter.of(context);

    // switch (index) {
    //   case 0:
    //     router.go('/'); // Assuming '/' is the HomeScreen
    //     break;
    //   case 1:
    //     router.go('/search');
    //     break;
    //   case 3:
    //     router.go('/activity');
    //     break;
    //   case 4:
    //     router.go('/profile');
    //     break;
    //   default:
    //     break;
    // }

    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWriteTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const WriteModal(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex != 1 && _selectedIndex != 3 && _selectedIndex != 4
          ? AppBar(
              title: SvgPicture.asset(
                'assets/icons/threads-icon.svg',
                width: 40,
                height: 40,
                color: isDarkMode(context) ? Colors.white : Colors.black,
              ),
              leadingWidth: 100,
              elevation: 0,
            )
          : null,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          // Offstage(
          //   offstage: !_isModalVisible,
          //   child: const WriteModal(),
          // ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
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
                onTap: () {
                  _onWriteTap(context);
                },
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
