import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';

class BrokenLine extends StatelessWidget {
  final double size;
  final Color color;

  BrokenLine({
    this.size = 10,
    this.color = PlatformTheme.secondaryColorLight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CustomPaint(
        size: Size(size, size),
        foregroundPainter: new MyPainter(color: color),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Color color;

  MyPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 5), Offset(startX + dashWidth, 5), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
