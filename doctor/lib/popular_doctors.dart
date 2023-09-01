import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopularDoctor extends StatelessWidget {
  const PopularDoctor({Key? key}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Icon(
                        Icons.search_sharp,
                        color: Color(0xFF677294),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Doctor',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0)),
                      onPressed: () {},
                      child: const Text(
                        'See all >',
                        style: TextStyle(
                          color: Color(0xFF677294),
                          fontSize: 10,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.30,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 20,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 12, 20),
                          width: 136,
                          height: 200,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                    "assets/images/live_doctor.jpeg"),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                'Dr. Truluck Nik',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              const Text(
                                'Medicine Specialist',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 10,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 12, 20),
                          width: 136,
                          height: 200,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                    "assets/images/live_doctor.jpeg"),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                'Dr. Truluck Nik',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              const Text(
                                'Medicine Specialist',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 10,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 12, 20),
                          width: 136,
                          height: 200,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                    "assets/images/live_doctor.jpeg"),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                'Dr. Truluck Nik',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              const Text(
                                'Medicine Specialist',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 10,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  'Category',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 18,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.30,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        height: 104,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/popular_doctors.jpg",
                                height: 82,
                                width: 82,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
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
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        height: 104,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/popular_doctors.jpg",
                                height: 82,
                                width: 82,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
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
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        height: 104,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/popular_doctors.jpg",
                                height: 82,
                                width: 82,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
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
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        height: 104,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/popular_doctors.jpg",
                                height: 82,
                                width: 82,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
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
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        height: 104,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/popular_doctors.jpg",
                                height: 82,
                                width: 82,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
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
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
