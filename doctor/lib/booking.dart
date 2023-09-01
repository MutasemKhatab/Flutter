import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

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
            margin: const EdgeInsets.fromLTRB(20, 36, 0, 0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                      'Select Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 34, 20, 0),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 88,
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
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          "assets/images/live_doctor.jpeg",
                          width: 71,
                          height: 68,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Dr. Shruti Kedia',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 16,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 15,
                                )
                              ],
                            ),
                            const Text(
                              'Upasana Dental Clinic, salt lake',
                              style: TextStyle(
                                color: Color(0xFF677294),
                                fontSize: 12,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.30,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/star.svg",
                                  height: 10,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.yellow, BlendMode.srcIn),
                                ),
                                SvgPicture.asset(
                                  "assets/images/star.svg",
                                  height: 10,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.yellow, BlendMode.srcIn),
                                ),
                                SvgPicture.asset(
                                  "assets/images/star.svg",
                                  height: 10,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.yellow, BlendMode.srcIn),
                                ),
                                SvgPicture.asset(
                                  "assets/images/star.svg",
                                  height: 10,
                                ),
                                SvgPicture.asset(
                                  "assets/images/star.svg",
                                  height: 10,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 34, 0, 20),
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      FittedBox(
                        child: Container(
                          height: 54,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0x19677294)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Today, 23 Feb',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 16,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              Text(
                                'No slots available',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 10,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Container(
                          height: 54,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0EBE7F),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0x19677294)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Tomorrow, 24 Feb',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              Text(
                                '9 slots available',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Container(
                          height: 54,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0EBE7F),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0x19677294)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Tomorrow, 24 Feb',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              Text(
                                '9 slots available',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: const Text(
                    'Today, 23 Feb',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 18,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 35, 20, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Afternoon 7 slots',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        children: [
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0x140EBE7F),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFF0EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 20, 20),
                  width: MediaQuery.of(context).size.width,
                  height: 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Evening 5 slots',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        children: [
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0x140EBE7F),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFF0EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0x140EBE7F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: const Text(
                                '1:00 PM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 13,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: const Text(
                    'No slots available',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF677294),
                      fontSize: 14,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 35, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 50),
                        backgroundColor: const Color(0xFF0EBE7F)),
                    child: const Text(
                      'Next availability on wed, 24 Feb',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: const Text(
                    'OR',
                    style: TextStyle(
                      color: Color(0xFF677294),
                      fontSize: 14,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 35, 0),
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          side: const BorderSide(
                              color: Color(0x7F0EBE7F), width: 0.5)),
                      child: const Text(
                        'Contact Clinic',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0EBE7F),
                          fontSize: 18,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
