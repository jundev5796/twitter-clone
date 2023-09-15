import 'package:go_router/go_router.dart';
import 'package:twitter_clone/home/main_screen.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/:tab(home|search|activity|profile)",
      name: MainScreen.routeName,
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainScreen(tab: tab);
      },
    )
    // GoRoute(
    //   path: "/",
    //   builder: (context, state) => const MainScreen(),
    // ),
    // GoRoute(
    //   path: "/search",
    //   builder: (context, state) => const SearchScreen(),
    // ),
    // GoRoute(
    //   path: "/activity",
    //   builder: (context, state) => const ActivityScreen(),
    // ),
    // GoRoute(
    //   path: "/profile",
    //   builder: (context, state) => const ProfileScreen(),
    // ),
    // GoRoute(
    //   path: "/settings",
    //   builder: (context, state) => const SettingsScreen(),
    // ),
    // GoRoute(
    //   path: "/settings/privacy",
    //   builder: (context, state) => const PrivacyScreen(),
    // ),

    // GoRoute(
    //   path: "/",
    //   builder: (context, state) => const CameraScreen(),
    // )
  ],
);
