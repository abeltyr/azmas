import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';

class VerticalBrokenLine extends StatelessWidget {
  final double size;
  final Color color;

  VerticalBrokenLine({
    this.size = 10,
    this.color = PlatformTheme.secondaryColorLight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: double.infinity,
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
    double dashHeight = 9, dashSpace = 5, startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(
          Offset(5, startY),
          Offset(
            5,
            startY + dashHeight,
          ),
          paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
