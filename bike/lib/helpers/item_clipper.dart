import 'package:flutter/material.dart';

class ItemClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}