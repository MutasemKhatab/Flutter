import 'dart:ui';

import 'package:bike/helpers/nav_bar_painter.dart';
import 'package:bike/helpers/nav_clipper.dart';
import 'package:bike/widgets/nav_button.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 70,
          child: ClipPath(
            clipper: NavClipper(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: CustomPaint(
                painter: NavPainter(),
              ),
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavButton(),
            NavButton(),
            NavButton(),
            NavButton(),
          ],
        )
      ],
    );
  }
}
