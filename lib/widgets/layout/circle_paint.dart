import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final Color circleColor;
  CirclePainter({required this.circleColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..color = circleColor;
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}