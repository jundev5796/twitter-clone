import 'package:go_router/go_router.dart';
import 'package:twitter_clone/home/contents/activity/activity_screen.dart';
import 'package:twitter_clone/home/contents/profile/privacy_screen.dart';
import 'package:twitter_clone/home/contents/profile/profile_screen.dart';
import 'package:twitter_clone/home/contents/profile/settings_screen.dart';
import 'package:twitter_clone/home/contents/search/search_screen.dart';
import 'package:twitter_clone/home/main_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: "/activity",
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: "/settings/privacy",
      builder: (context, state) => const PrivacyScreen(),
    ),

    // GoRoute(
    //   path: "/",
    //   builder: (context, state) => const CameraScreen(),
    // )
  ],
);
