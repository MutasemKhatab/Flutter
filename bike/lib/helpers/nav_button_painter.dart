import 'package:bike/helpers/theme.dart';
import 'package:flutter/material.dart';

class NavButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillGradient = LinearGradient(
      begin: const Alignment(0.46, -0.89),
      end: const Alignment(-0.46, 0.89),
      colors: [
        theme.colorScheme.primary,
        theme.colorScheme.secondary,
      ],
    );
    const borderGradient = LinearGradient(
      begin: Alignment(0.22, -0.98),
      end: Alignment(-0.22, 0.98),
      colors: [Color(0xF0363E50), Color(0xF0181D26)],
    );

    final paint = Paint()
      ..shader = fillGradient
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..shader = borderGradient
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path()
      ..moveTo(5, 5)
      ..lineTo(size.width - 10, 0) // subtract the radius from the width
      ..arcToPoint(Offset(size.width, 10),
          radius: const Radius.circular(10),
          clockwise: true) // top right corner
      ..lineTo(
          size.width, size.height - 10) // subtract the radius from the height
      ..arcToPoint(Offset(size.width - 10, size.height - 5),
          radius: const Radius.circular(10),
          clockwise: true) // bottom right corner
      ..lineTo(10, size.height) // add the radius to the width
      ..arcToPoint(Offset(0, size.height - 10),
          radius: const Radius.circular(10),
          clockwise: true) // bottom left corner
      ..lineTo(0, 10) // add the radius to the height
      ..arcToPoint(const Offset(5, 5),
          radius: const Radius.circular(10), clockwise: true) // top left corner
      ..close();

    canvas.drawPath(path, borderPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
