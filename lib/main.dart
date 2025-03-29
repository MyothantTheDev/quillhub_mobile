import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/providers/theme_mode_provider.dart';
import 'package:quillhub/services/routing/route_service.dart';
import 'package:quillhub/utils/core/custom_theme.dart';


void main() {
  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  App({super.key});

  final _routerService = RouterService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    ThemeData lightTheme = CustomTheme.lightTheme();
    ThemeData darkTheme = CustomTheme.darkTheme();

    final themeMode = ref.watch(themeProvider);

    return Consumer(
        builder: (context, ref, child) {
           return MaterialApp.router(
             title: 'QuillHub',
             debugShowCheckedModeBanner: false,
             themeMode: themeMode,
             theme: lightTheme,
             darkTheme: darkTheme,
             routerConfig: _routerService.getRouter(),
           );
        },
    );
  }
}
