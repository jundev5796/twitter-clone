import 'package:go_router/go_router.dart';
import 'package:twitter_clone/home/contents/profile/privacy_screen.dart';
import 'package:twitter_clone/home/contents/profile/settings_screen.dart';
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
    ),
    GoRoute(
      path: SettingsScreen.routeURL,
      name: SettingsScreen.routeName,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: PrivacyScreen.routeURL,
      name: PrivacyScreen.routeName,
      builder: (context, state) => const PrivacyScreen(),
    ),

    // GoRoute(
    //   path: "/",
    //   builder: (context, state) => const CameraScreen(),
    // )
  ],
);
