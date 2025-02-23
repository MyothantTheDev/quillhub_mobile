import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:quillhub/screens/home.dart';
import 'package:quillhub/screens/login.dart';
import 'package:quillhub/screens/profile.dart';
import 'package:quillhub/screens/splash.dart';
import 'package:quillhub/widgets/custom_nav_app_bar.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

class RouterService {
  /// Section route (inside ShellRoute, uses _shellNavigatorKey)
  ///
  final GoRouter _router = GoRouter(
    // navigatorKey: _rootNavigatorKey, // Root navigator for full-screen pages
    initialLocation: '/',
    routes: [

      /// Splash Screen (Full-Screen)
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
      ),

      /// ShellRoute with bottom navigation


          /// Home screen with sections
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return CustomNavAppBar(child: HomeScreen());
          },
          routes: [
            GoRoute(
              path: ':category/:id',
              // parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                final id = state.pathParameters['id'];
                final category = state.pathParameters['category'];
                return Placeholder();
              },
            ),
            /// Profile screen (Full-Screen)
            GoRoute(
              path: '/profile',
              // parentNavigatorKey: _rootNavigatorKey, // Ensures it's a full-screen page
              builder: (BuildContext context, GoRouterState state) {
                return ProfileScreen();
              },
              name: 'user_profile',
            ),

            /// Login screen
            GoRoute(
                path: '/login',
                // parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return LoginScreen();
                },
                name: 'login'
            )
          ],
          name: 'home',
        ),



    ],
  );

  GoRouter getRouter() {
    return _router;
  }
}
