import 'package:flutter/material.dart';
import 'package:quillhub/widgets/circle_paint.dart';

class BackgroundCircles extends StatelessWidget {
  final double size;
  final Color color;
  const BackgroundCircles({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: CirclePainter(circleColor: color)),
    );
  }
}