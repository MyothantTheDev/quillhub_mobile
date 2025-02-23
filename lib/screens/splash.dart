import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quillhub/providers/article_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the article provider. Initial state is empty list.
    // final articles = ref.watch(articleNotifierProvider);

    // Listen to load articles.
    // ref.listen(articleNotifierProvider, (prev, next) {
    //   // Check the article list.
    //   if(next.isNotEmpty) {
    //     WidgetsBinding.instance.addPostFrameCallback((_) {
    //       GoRouter.of(context).go('Home');
    //     });
    //   }
    // });

    Future.delayed(Duration(seconds: 2))
    .then((value) => context.goNamed('home'));


    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff100d2b),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 250,),
            Image.asset('assets/images/icon.png', width: 150),
            const SizedBox(height: 10,),
            const Text(
              'QuillHub',
              style: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.white70,
                fontSize: 25
              ),
            ),
            const SizedBox(height: 40,),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
