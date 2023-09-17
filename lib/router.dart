import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/authentication/create_account_screen.dart';
import 'package:twitter_clone/authentication/login_screen.dart';
import 'package:twitter_clone/authentication/repos/authentication_repo.dart';
import 'package:twitter_clone/home/contents/profile/privacy_screen.dart';
import 'package:twitter_clone/home/contents/settings/views/settings_screen.dart';
import 'package:twitter_clone/home/main_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != CreateAccount.routeURL &&
            state.matchedLocation != LoginScreen.routeURL) {
          return CreateAccount.routeURL;
        }
      }
      return null;
    },
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
});
