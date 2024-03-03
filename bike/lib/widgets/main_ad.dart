import 'dart:ui';

import 'package:bike/helpers/my_clipper.dart';
import 'package:bike/helpers/my_shape.dart';
import 'package:flutter/material.dart';

class MainAd extends StatelessWidget {
  const MainAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black.withOpacity(0.05),
      child: SizedBox(
        width: 350,
        height: 240,
        child: ClipPath(
          clipper: MyClipper(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: CustomPaint(
              painter: MyShape(),
              child: Stack(
                children: [
                  Positioned(
                    left: 17,
                    top: 30,
                    child: Container(
                      width: 316.82,
                      height: 153,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/main_bike.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 177,
                    child: Text(
                      '30% Off',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 26,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
