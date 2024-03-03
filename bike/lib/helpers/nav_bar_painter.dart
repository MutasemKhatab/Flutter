import 'package:flutter/material.dart';

class NavPainter extends CustomPainter {
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
    final path = Path();
    path.moveTo(0, 20);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, borderPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
