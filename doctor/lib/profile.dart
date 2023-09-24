import 'dart:ui';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 335,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF0EBE7F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Icon(
                                Icons.chevron_left_sharp,
                                color: Color.fromARGB(255, 103, 114, 148),
                              ),
                            ),
                            const Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Set up your profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Update your profile to connect your doctor with\nbetter impression.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.30,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(65),
                                    child: Image.asset(
                                      "assets/images/live_doctor1.png",
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                  bottom: 13,
                                  right: 125,
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: const ShapeDecoration(
                                        shape: CircleBorder(),
                                        color: Color(0xCC677294)),
                                    child: const Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal information',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding:
                            const EdgeInsets.only(left: 20, top: 9, bottom: 13),
                        height: 60,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                color: Color(0xFF0EBE7F),
                                fontSize: 10,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                            Text(
                              'Abdullah Mamun',
                              style: TextStyle(
                                color: Color(0xFF677294),
                                fontSize: 16,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.only(
                            left: 20, top: 9, bottom: 13, right: 20),
                        height: 60,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Contact Number',
                                  style: TextStyle(
                                    color: Color(0xFF0EBE7F),
                                    fontSize: 10,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                Text(
                                  '+8801800000000',
                                  style: TextStyle(
                                    color: Color(0xFF677294),
                                    fontSize: 16,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.edit)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.only(
                            left: 20, top: 9, bottom: 13, right: 20),
                        height: 60,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date of birth',
                                  style: TextStyle(
                                    color: Color(0xFF0EBE7F),
                                    fontSize: 10,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                Text(
                                  'DD MM YYYY',
                                  style: TextStyle(
                                    color: Color(0xFF677294),
                                    fontSize: 16,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.edit)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        width: MediaQuery.of(context).size.width,
                        padding:
                            const EdgeInsets.only(left: 20, top: 9, bottom: 13),
                        height: 60,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(
                                color: Color(0xFF0EBE7F),
                                fontSize: 10,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                            Text(
                              'Add Details',
                              style: TextStyle(
                                color: Color(0xFF677294),
                                fontSize: 16,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(300, 50),
                              backgroundColor: const Color(0xFF0EBE7F),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {},
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      )
                    ],
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
