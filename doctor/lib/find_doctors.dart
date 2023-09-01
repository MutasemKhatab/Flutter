import 'dart:ui';

import 'package:flutter/material.dart';

class FindDoctors extends StatelessWidget {
  const FindDoctors({Key? key}) : super(key: key);

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
            margin: const EdgeInsets.fromLTRB(0, 36, 0, 0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      width: 30,
                      height: 30,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.chevron_left_sharp,
                        color: Color.fromARGB(78, 114, 148, 1),
                      ),
                    ),
                    const Text(
                      'Find Doctors',
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.30,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 34, 19, 24),
                  width: double.maxFinite,
                  height: 54,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x11000000),
                        blurRadius: 40,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          cursorHeight: 15,
                          cursorColor: Color(0xFF0EBE7E),
                          style: TextStyle(
                            backgroundColor: Colors.white,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: Color(0xFF677294),
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        splashRadius: 1,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 19, 10),
                            padding: const EdgeInsets.fromLTRB(20, 18, 17, 14),
                            width: double.maxFinite,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        "assets/images/live_doctor.jpeg",
                                        fit: BoxFit.cover,
                                        height: 87,
                                        width: 92,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      'Next Available ',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 13,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                    const Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '10:00',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 14,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' AM tomorrow',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 14,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            'Dr. Shruti Kedia',
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
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                      const Text(
                                        'Tooths Dentist',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7F),
                                          fontSize: 13,
                                          fontFamily: 'PT Sans',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      const Text(
                                        '7 Years experience ',
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
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 4, 0),
                                            width: 10,
                                            height: 10,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF0EBE7F),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                          const Text(
                                            '87%',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 11,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                17, 0, 4, 0),
                                            width: 10,
                                            height: 10,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF0EBE7F),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                          const Text(
                                            '69 Patient Stories',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 11,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.30,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(112, 34),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                backgroundColor:
                                                    const Color(0xFF0EBE7F)),
                                            child: const Text(
                                              'Book Now',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 19, 10),
                            padding: const EdgeInsets.fromLTRB(20, 18, 17, 14),
                            width: double.maxFinite,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        "assets/images/live_doctor.jpeg",
                                        fit: BoxFit.cover,
                                        height: 87,
                                        width: 92,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      'Next Available ',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 13,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                    const Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '10:00',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 14,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' AM tomorrow',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 14,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            'Dr. Shruti Kedia',
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
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                      const Text(
                                        'Tooths Dentist',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7F),
                                          fontSize: 13,
                                          fontFamily: 'PT Sans',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      const Text(
                                        '7 Years experience ',
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
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 4, 0),
                                            width: 10,
                                            height: 10,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF0EBE7F),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                          const Text(
                                            '87%',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 11,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                17, 0, 4, 0),
                                            width: 10,
                                            height: 10,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF0EBE7F),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                          const Text(
                                            '69 Patient Stories',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 11,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.30,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(112, 34),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                backgroundColor:
                                                    const Color(0xFF0EBE7F)),
                                            child: const Text(
                                              'Book Now',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 19, 10),
                            padding: const EdgeInsets.fromLTRB(20, 18, 17, 14),
                            width: double.maxFinite,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        "assets/images/live_doctor.jpeg",
                                        fit: BoxFit.cover,
                                        height: 87,
                                        width: 92,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      'Next Available ',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 13,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                    const Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '10:00',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 14,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' AM tomorrow',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 14,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            'Dr. Shruti Kedia',
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
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                      const Text(
                                        'Tooths Dentist',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7F),
                                          fontSize: 13,
                                          fontFamily: 'PT Sans',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      const Text(
                                        '7 Years experience ',
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
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 4, 0),
                                            width: 10,
                                            height: 10,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF0EBE7F),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                          const Text(
                                            '87%',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 11,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                17, 0, 4, 0),
                                            width: 10,
                                            height: 10,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF0EBE7F),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                          const Text(
                                            '69 Patient Stories',
                                            style: TextStyle(
                                              color: Color(0xFF677294),
                                              fontSize: 11,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.30,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(112, 34),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                backgroundColor:
                                                    const Color(0xFF0EBE7F)),
                                            child: const Text(
                                              'Book Now',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
