import 'package:flutter/material.dart';
import 'package:quillhub/widgets/background_circle.dart';

class SignInBackground extends StatelessWidget {
  const SignInBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    return Stack(
      children: [
        Positioned(left: width * 0.55, top: -50, child: BackgroundCircles(size: width * 0.55, color: Colors.indigo.shade100)),
        Positioned(left: width * 0.63, top: -50, child: BackgroundCircles(size: width * 0.48, color: Colors.indigo)),
        Positioned(left: 40, top: height * 0.88, child: BackgroundCircles(size: width * 0.58, color: Colors.indigo.shade100)),
        Positioned(left: 40, top: height * 0.9, child: BackgroundCircles(size: width * 0.5, color: Colors.indigo)),
      ],
    );
  }

}
