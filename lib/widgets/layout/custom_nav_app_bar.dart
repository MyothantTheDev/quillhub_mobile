import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/widgets/layout/categories_bar.dart';
import 'package:quillhub/widgets/profile/profile_button_widget.dart';
import 'package:quillhub/widgets/buttons/theme_mode_toggler.dart';

class CustomNavAppBar extends StatelessWidget {

  const CustomNavAppBar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height * 0.12),
        child: _CustomAppBar(),
      ),
      body: child,
    );
  }

}

class _CustomAppBar extends ConsumerWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
        padding: const EdgeInsets.only(top: 55, left: 10, right: 10),
        color: Color(0xff100d2b),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'QuillHub',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.white70,
                    fontSize: 25,
                  ),
                ),
                Row(
                  children: [
                    ThemeModeToggle(),
                    ProfileButtonWidget()
                  ],
                )
              ],
            ),
            Container(
                margin: EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.001),
                child: CategoriesBar()
            )
          ],
        )
    );
  }

}
