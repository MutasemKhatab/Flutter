//create a custom paint
import 'package:flutter/material.dart';

class MyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.015)
      ..style = PaintingStyle.fill;
    Paint fillPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    const double radius = 20;
    Path path = Path();
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(Offset(size.width, radius),
        radius: const Radius.circular(radius), clockwise: true);
    path.lineTo(size.width, size.height * 0.75 - radius);
    path.arcToPoint(Offset(size.width - radius, size.height * 0.75),
        radius: const Radius.circular(radius), clockwise: true);
    path.lineTo(radius, size.height);
    path.arcToPoint(Offset(0, size.height - radius),
        radius: const Radius.circular(radius), clockwise: true);
    path.lineTo(0, radius);
    path.arcToPoint(const Offset(radius, 0),
        radius: const Radius.circular(radius), clockwise: true);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
