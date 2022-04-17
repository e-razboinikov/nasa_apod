import 'package:go_router/go_router.dart';
import 'package:nasa_apod/features/apod_screen/presentation/pages/apod_page.dart';
import 'package:nasa_apod/features/apod_screen/presentation/pages/full_screen_image.dart';
import 'package:nasa_apod/features/splash/presentation/pages/splash_screen_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreenPage.name,
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      path: '/apod',
      name: ApodPage.name,
      builder: (context, state) => const ApodPage(),
      routes: [
        GoRoute(
          path: 'fullscreen-image',
          name: FullScreenImage.name,
          builder: (context, state) => FullScreenImage(
            imageUrl: (state.extra as String),
          ),
        ),
      ],
    ),
  ],
);
