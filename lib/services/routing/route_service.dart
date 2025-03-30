import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:quillhub/screens/home/home.dart';
import 'package:quillhub/screens/auth/login.dart';
import 'package:quillhub/screens/profile/profile.dart';
import 'package:quillhub/screens/splash.dart';
import 'package:quillhub/widgets/layout/back_home.dart';
import 'package:quillhub/widgets/layout/custom_nav_app_bar.dart';
import 'package:quillhub/screens/auth/register.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoutes {
  home("home", "/home"),
  profile("user_profile", "/profile"),
  login("login", "/login"),
  register("register_route", "/register");

  final String route_name;
  final String route_path;

  const AppRoutes(this.route_name, this.route_path);
}

class RouterService {
  /// Section route (inside ShellRoute, uses _shellNavigatorKey)
  ///
  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey, // Root navigator for full-screen pages
    initialLocation: '/',
    routes: [

      /// Splash Screen (Full-Screen)
      GoRoute(
        path: '/',
        builder: (_, __) => const SplashScreen(),
      ),

      /// ShellRoute with bottom navigation

          /// Home screen with sections
        GoRoute(
          path: AppRoutes.home.route_path,
          builder: (BuildContext context, GoRouterState state) {
            return CustomNavAppBar(child: HomeScreen());
          },
          routes: [
            GoRoute(
              path: ':category/:id',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                final id = state.pathParameters['id'];
                final category = state.pathParameters['category'];
                return Placeholder();
              },
            ),
          ],
          name: 'home',
        ),

      /// Profile screen (Full-Screen)
      GoRoute(
        path: AppRoutes.profile.route_path,
        name: AppRoutes.profile.route_name,
        parentNavigatorKey: _rootNavigatorKey, // Ensures it's a full-screen page
        builder: (_, __) => ProfileScreen(),

      ),

      /// Login screen
      GoRoute(
        path: AppRoutes.login.route_path,
        name: AppRoutes.login.route_name,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => BackHome(child: LoginScreen()),

      ),

      /// Register screen
      GoRoute(
          path: AppRoutes.register.route_path,
          name: AppRoutes.register.route_name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, __) => BackHome(child: RegisterScreen()),
      )


    ],
  );

  GoRouter getRouter() {
    return _router;
  }
}
