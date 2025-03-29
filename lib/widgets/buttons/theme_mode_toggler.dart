import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/providers/theme_mode_provider.dart';

class ThemeModeToggle extends ConsumerWidget {
  const ThemeModeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(themeProvider.notifier).toggleTheme();
      },
      icon: Icon(ref.watch(themeProvider) == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
      color: Colors.white,
    );
  }
}