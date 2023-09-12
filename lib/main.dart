import 'package:flutter/material.dart';
import 'package:twitter_clone/router.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone',
      themeMode: ThemeMode.system,
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
