import 'dart:ui';

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 36, 0, 30),
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
                        'Setting',
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
                const Text(
                  'Account settings',
                  style: TextStyle(
                    color: Color(0xFF677294),
                    fontSize: 18,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    height: 0.09,
                    letterSpacing: -0.30,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(), color: Color(0xFFEB5757)),
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                    const Text(
                      'Change Password',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right_sharp),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFF0EBE7F).withOpacity(0.06),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(), color: Color(0xFF219653)),
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                    const Text(
                      'Notifcations',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right_sharp),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFF0EBE7F).withOpacity(0.06),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(), color: Color(0xFF56CCF2)),
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.data_thresholding_outlined,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                    const Text(
                      'Statistics',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right_sharp),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFF0EBE7F).withOpacity(0.06),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color(0xFFF2994A),
                      ),
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.group,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                    const Text(
                      'About us',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right_sharp),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFF0EBE7F).withOpacity(0.06),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'More options',
                  style: TextStyle(
                    color: Color(0xFF677294),
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                    letterSpacing: -0.30,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      'Text messages',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      activeColor: const Color(0xFF0EBE7F),
                      value: true,
                      onChanged: (value) {},
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFF0EBE7F).withOpacity(0.06),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      'Phone calls',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      activeColor: const Color(0xFF0EBE7F),
                      value: true,
                      onChanged: (value) {},
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFF0EBE7F).withOpacity(0.06),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text(
                      'Languages',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'English',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 12,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_sharp,
                      color: Color(0xFF677294),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFF0EBE7F).withOpacity(0.06),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text(
                      'Currency',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$-USD',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 12,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_sharp,
                      color: Color(0xFF677294),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFF0EBE7F).withOpacity(0.06),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text(
                      'Linked accounts',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Facebook, Google',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 12,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_sharp,
                      color: Color(0xFF677294),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
