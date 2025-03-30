import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BackHome extends ConsumerWidget {
  BackHome({super.key, required this.child});
  Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if(didPop) {
            result;
          }
          context.goNamed('home');
        },
        child: child
    );
  }

}