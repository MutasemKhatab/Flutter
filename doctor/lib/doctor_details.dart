import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key});

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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.fromLTRB(20, 36, 0, 0),
            child: Column(
              children: [
                Row(
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
                      'Doctor Details',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.search,
                      color: Color(0xFF677294),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 38, 20, 0),
                  padding: const EdgeInsets.all(18),
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // ignore: sized_box_for_whitespace
                              Container(
                                width: 92,
                                height: 87,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                      "assets/images/popular_doctors.jpg"),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Text(
                                          'Dr. Pediatrician',
                                          style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 18,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.favorite_sharp,
                                          color: Color(0xFFFF0000),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      'Specialist Cardiologist ',
                                      style: TextStyle(
                                        color: Color(0xFF677294),
                                        fontSize: 14,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 12,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Colors.yellow,
                                                      BlendMode.srcIn),
                                            ),
                                            SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 12,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Colors.yellow,
                                                      BlendMode.srcIn),
                                            ),
                                            SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 12,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Colors.yellow,
                                                      BlendMode.srcIn),
                                            ),
                                            SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 12,
                                            ),
                                            SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 12,
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        const FittedBox(
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '\$',
                                                  style: TextStyle(
                                                    color: Color(0xFF0EBE7F),
                                                    fontSize: 16,
                                                    fontFamily: 'Rubik',
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: -0.30,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' ',
                                                  style: TextStyle(
                                                    color: Color(0xFF333333),
                                                    fontSize: 16,
                                                    fontFamily: 'Rubik',
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: -0.30,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '28.00/hr',
                                                  style: TextStyle(
                                                    color: Color(0xE5677294),
                                                    fontSize: 16,
                                                    fontFamily: 'Rubik',
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: -0.30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0EBE7F),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                fixedSize: const Size(140, 32)),
                            onPressed: () {},
                            child: const Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 24, 20, 0),
                  width: MediaQuery.of(context).size.width - 100,
                  height: 84,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 64,
                        decoration: ShapeDecoration(
                          color: const Color.fromARGB(31, 202, 202, 202),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32,
                                child: Text(
                                  '100',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 18,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              Text(
                                'Runing',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 14,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              )
                            ]),
                      ),
                      Container(
                        width: 90,
                        height: 64,
                        decoration: ShapeDecoration(
                          color: const Color.fromARGB(31, 202, 202, 202),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32,
                                child: Text(
                                  '100',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 18,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              Text(
                                'Ongoing',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 14,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              )
                            ]),
                      ),
                      Container(
                        width: 90,
                        height: 64,
                        decoration: ShapeDecoration(
                          color: const Color.fromARGB(31, 202, 202, 202),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32,
                                child: Text(
                                  '100',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 18,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              Text(
                                'Patient',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 14,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(0, 27, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Services',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.30,
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '1.',
                              style: TextStyle(
                                color: Color(0xFF0EBE7F),
                                fontSize: 13,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.30,
                              ),
                            ),
                            TextSpan(
                              text: '   ',
                              style: TextStyle(
                                color: Color(0xE5677294),
                                fontSize: 13,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.30,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Patient care should be the number one priority.',
                              style: TextStyle(
                                color: Color(0xE5677294),
                                fontSize: 13,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.40,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0x19677294),
                            ),
                          ),
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '2.',
                              style: TextStyle(
                                color: Color(0xFF0EB67A),
                                fontSize: 13,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.30,
                              ),
                            ),
                            TextSpan(
                              text: '   ',
                              style: TextStyle(
                                color: Color(0xE5677294),
                                fontSize: 13,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.30,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'If you run your practiceyou know how frustrating.',
                              style: TextStyle(
                                color: Color(0xE5677294),
                                fontSize: 13,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.40,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0x19677294),
                            ),
                          ),
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '3.',
                              style: TextStyle(
                                color: Color(0xFF0EB478),
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.30,
                              ),
                            ),
                            TextSpan(
                              text: '   ',
                              style: TextStyle(
                                color: Color(0xE5677294),
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.30,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'That’s why some of appointment reminder system.',
                              style: TextStyle(
                                color: Color(0xE5677294),
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 210,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 30,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 190,
                    decoration: ShapeDecoration(
                      color: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      "Map",
                      style: TextStyle(fontSize: 50),
                    )),
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
