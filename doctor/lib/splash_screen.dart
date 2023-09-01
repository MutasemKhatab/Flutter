import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: -150,
        left: -150,
        child: Container(
          width: 216,
          height: 216,
          decoration: const ShapeDecoration(
            color: Color(0xB72596BE),
            shape: OvalBorder(),
          ),
        ),
      ),
      Positioned(
        bottom: -150,
        right: -150,
        child: Container(
          width: 216,
          height: 216,
          decoration: const ShapeDecoration(
            color: Color(0xB72596BE),
            shape: OvalBorder(),
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
        child: Container(color: Colors.transparent),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash_screen_logo.png"),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Doctor Hunt",
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  letterSpacing: -0.3,
                  color: const Color.fromARGB(255, 34, 34, 1)),
            )
          ],
        ),
      ),
    ]);
  }
}
