import 'package:flutter/material.dart';
import 'package:quillhub/widgets/background_circle.dart';

class RegisterBackground extends StatelessWidget {
  const RegisterBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Positioned(left: width * 0.35, top: -130,child: BackgroundCircles(size: width * 0.55, color: Colors.indigo.shade100)),
        Positioned(left: width * 0.25, top: -150,child: BackgroundCircles(size: width * 0.55, color: Colors.indigo)),
      ],
    );
  }
  
}