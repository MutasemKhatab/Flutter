import 'dart:ui';

import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.fromLTRB(20, 36, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: ShapeDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Icon(
                        Icons.chevron_left_sharp,
                        color: Color.fromARGB(255, 103, 114, 148),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Help Center',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 54,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'I have an issue with',
                    style: TextStyle(
                      color: Color(0xFF0EBE7F),
                      fontSize: 18,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w300,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 155,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Booking a new Appointment',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.chevron_right_outlined,
                              size: 30,
                              color: Color(0xFF677294),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Booking a new Appointment',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.chevron_right_outlined,
                              size: 30,
                              color: Color(0xFF677294),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Booking a new Appointment',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.chevron_right_outlined,
                              size: 30,
                              color: Color(0xFF677294),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
