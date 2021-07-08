import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';

class BrokenLine extends StatelessWidget {
  final double size;

  BrokenLine({
    this.size = 70,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      foregroundPainter: new MyPainter(),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = PlatformTheme.secondaryColorLight
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 5), Offset(startX + dashWidth, 5), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
