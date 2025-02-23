import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/providers/theme_mode_provider.dart';
import 'package:quillhub/services/route_service.dart';
import 'package:quillhub/utils/custom_theme.dart';


void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = RouterService();

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // Provide static themes here so MaterialApp doesn't rebuild on theme changes.
      theme: CustomTheme.lightTheme(),
      darkTheme: CustomTheme.darkTheme(),
      routerConfig: routes.getRouter(),
      // Wrap the built navigator with a Consumer to update the theme dynamically.
      builder: (context, child) {
        return Consumer(
          builder: (context, ref, child) {
            // Listen to theme changes here.
            final themeMode = ref.watch(themeProvider);
            final themeData = themeMode == ThemeMode.dark
                ? CustomTheme.darkTheme()
                : CustomTheme.lightTheme();
            return AnimatedTheme(
              data: themeData,
              duration: const Duration(milliseconds: 300),
              child: child!,
            );
          },
          child: child,
        );
      },
    );
  }
}
