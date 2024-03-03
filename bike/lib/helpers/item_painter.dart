import 'package:flutter/material.dart';

class ItemPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillGradient = LinearGradient(
      begin: const Alignment(0.22, -0.98),
      end: const Alignment(-0.22, 0.98),
      colors: [
        const Color(0xFF363E50).withOpacity(0.7),
        const Color(0xFF181D26).withOpacity(0.7)
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
      ..moveTo(15, 25)
      ..lineTo(size.width - 25, 0) // subtract the radius from the width
      ..arcToPoint(Offset(size.width, 20),
          radius: const Radius.circular(20),
          clockwise: true) // top right corner
      ..lineTo(
          size.width, size.height - 45) // subtract the radius from the height
      ..arcToPoint(Offset(size.width - 15, size.height - 25),
          radius: const Radius.circular(20),
          clockwise: true) // bottom right corner
      ..lineTo(20, size.height) // add the radius to the width
      ..arcToPoint(Offset(0, size.height - 20),
          radius: const Radius.circular(20),
          clockwise: true) // bottom left corner
      ..lineTo(0, 45) // add the radius to the height
      ..arcToPoint(const Offset(15, 25),
          radius: const Radius.circular(20), clockwise: true) // top left corner
      ..close();

    canvas.drawPath(path, borderPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
