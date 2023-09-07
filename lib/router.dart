import 'package:go_router/go_router.dart';
import 'package:twitter_clone/camera/camera_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const CameraScreen(),
    )
  ],
);
