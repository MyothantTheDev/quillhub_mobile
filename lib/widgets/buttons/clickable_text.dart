import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Clickable_Text extends StatelessWidget {
  final String linkName;
  final Widget child;
  const Clickable_Text({super.key, required this.linkName, required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        context.goNamed(linkName);
      },
      child: child,
    );
  }

}