import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiagonsticsTests extends StatelessWidget {
  const DiagonsticsTests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -72,
            top: -32,
            child: Container(
              width: 216,
              height: 216,
              decoration: const ShapeDecoration(
                color: Color.fromARGB(90, 96, 205, 255),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            right: -48,
            bottom: -33,
            child: Container(
              width: 216,
              height: 216,
              decoration: const ShapeDecoration(
                color: Color(0x4C0EBE7E),
                shape: OvalBorder(),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 36, 0, 34),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Icon(
                          Icons.chevron_left_sharp,
                          color: Color.fromARGB(255, 103, 114, 148),
                        ),
                      ),
                      const Text(
                        'Diagonstics Tests',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 40),
                  width: 214,
                  height: 214,
                  child: SvgPicture.asset("assets/images/diagonstics.svg"),
                ),
                const Text(
                  'You haven’t booked any tests yet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 22,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.30,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                  child: const Text(
                    'Get started with your first health checkup',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF677294),
                      fontSize: 14,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                      height: 1.66,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(270, 55),
                        backgroundColor: const Color(0xFF0EBE7F)),
                    onPressed: () {},
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
