import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Doctors extends StatelessWidget {
  const Doctors({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.fromLTRB(20, 36, 0, 30),
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
                        'Add Records',
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
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  width: MediaQuery.of(context).size.width,
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
                Container(
                  alignment: Alignment.centerLeft,
                  height: 36,
                  margin: const EdgeInsets.only(left: 20, bottom: 24),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF0EBE7F)),
                          onPressed: () {},
                          child: const Text(
                            'All',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0x140EBE7F)),
                          onPressed: () {},
                          child: const Text(
                            'Dentist',
                            style: TextStyle(
                              color: Color(0xFF0EBE7F),
                              fontSize: 14,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0x140EBE7F)),
                          onPressed: () {},
                          child: const Text(
                            'physio Therapy',
                            style: TextStyle(
                              color: Color(0xFF0EBE7F),
                              fontSize: 14,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0x140EBE7F)),
                          onPressed: () {},
                          child: const Text(
                            'Cardiology',
                            style: TextStyle(
                              color: Color(0xFF0EBE7F),
                              fontSize: 14,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 234,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        height: 104,
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
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/live_doctor1.png",
                                width: 82,
                                height: 82,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        Icons.favorite,
                                        color: Color(0xFFFF0000),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
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
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 100,
                                        height: 20,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '2.4',
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                                style: TextStyle(
                                                  color: Color(0xFF677294),
                                                  fontSize: 16,
                                                  fontFamily: 'PT Sans',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '(',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '2475 views',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ')',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
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
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        height: 104,
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
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/live_doctor1.png",
                                width: 82,
                                height: 82,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        Icons.favorite,
                                        color: Color(0xFFFF0000),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
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
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 100,
                                        height: 20,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '2.4',
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                                style: TextStyle(
                                                  color: Color(0xFF677294),
                                                  fontSize: 16,
                                                  fontFamily: 'PT Sans',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '(',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '2475 views',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ')',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
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
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        height: 104,
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
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/live_doctor1.png",
                                width: 82,
                                height: 82,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        Icons.favorite,
                                        color: Color(0xFFFF0000),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
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
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 100,
                                        height: 20,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '2.4',
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                                style: TextStyle(
                                                  color: Color(0xFF677294),
                                                  fontSize: 16,
                                                  fontFamily: 'PT Sans',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '(',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '2475 views',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ')',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
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
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        height: 104,
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
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/live_doctor1.png",
                                width: 82,
                                height: 82,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        Icons.favorite,
                                        color: Color(0xFFFF0000),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
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
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 100,
                                        height: 20,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '2.4',
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                                style: TextStyle(
                                                  color: Color(0xFF677294),
                                                  fontSize: 16,
                                                  fontFamily: 'PT Sans',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '(',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '2475 views',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ')',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
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
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        height: 104,
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
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/live_doctor1.png",
                                width: 82,
                                height: 82,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        Icons.favorite,
                                        color: Color(0xFFFF0000),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
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
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 100,
                                        height: 20,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '2.4',
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                                style: TextStyle(
                                                  color: Color(0xFF677294),
                                                  fontSize: 16,
                                                  fontFamily: 'PT Sans',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '(',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '2475 views',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ')',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
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
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        height: 104,
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
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/live_doctor1.png",
                                width: 82,
                                height: 82,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        Icons.favorite,
                                        color: Color(0xFFFF0000),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
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
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.yellow, BlendMode.srcIn),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/star.svg",
                                        height: 12,
                                      ),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 100,
                                        height: 20,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '2.4',
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                                style: TextStyle(
                                                  color: Color(0xFF677294),
                                                  fontSize: 16,
                                                  fontFamily: 'PT Sans',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '(',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '2475 views',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ')',
                                                style: TextStyle(
                                                  color: Color(0xCC677294),
                                                  fontSize: 16,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w400,
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
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
