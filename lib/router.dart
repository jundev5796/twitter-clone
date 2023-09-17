import 'package:go_router/go_router.dart';
import 'package:twitter_clone/authentication/create_account_screen.dart';
import 'package:twitter_clone/authentication/login_screen.dart';
import 'package:twitter_clone/home/contents/profile/privacy_screen.dart';
import 'package:twitter_clone/home/contents/settings/views/settings_screen.dart';
import 'package:twitter_clone/home/main_screen.dart';

final router = GoRouter(
  initialLocation: CreateAccount.routeURL,
  routes: [
    GoRoute(
      path: CreateAccount.routeURL,
      name: CreateAccount.routeName,
      builder: (context, state) => const CreateAccount(),
    ),
    GoRoute(
      path: LoginScreen.routeURL,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
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
