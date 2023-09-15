import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_clone/home/contents/settings/repos/darkmode_config_repo.dart';
import 'package:twitter_clone/home/contents/settings/view_models/darkmode_config_vm.dart';
import 'package:twitter_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = DarkModeConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        darkmodeConfigProvider.overrideWith(
          () => DarkModeConfigViewModel(repository),
        ),
      ],
      child: const TwitterApp(),
    ),
  );
}

class TwitterApp extends ConsumerWidget {
  const TwitterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone',
      themeMode: ref.watch(darkmodeConfigProvider).darkmode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Typography.blackMountainView,
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade900,
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
    );
  }
}
//   @override
//   ConsumerState<TwitterApp> createState() => _TwitterAppState();
// }
