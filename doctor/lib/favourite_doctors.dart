import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteDoctors extends StatelessWidget {
  const FavouriteDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(iconSize: 30, items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home,
              color: Color(0xFF858EA9),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Color(0xFF0EBE7E),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              label: "dsfss",
              icon: Icon(
                Icons.menu_book,
                color: Color(0xFF858EA9),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.message, color: Color(0xFF858EA9)), label: "")
        ]),
        body: Stack(children: [
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
                        'Favourite Doctors',
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
                    margin: const EdgeInsets.fromLTRB(0, 34, 20, 24),
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
                  SizedBox(
                    height: 375,
                    child: GridView.count(
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 30),
                      crossAxisCount: 2,
                      children: [
                        Container(
                          width: 160,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0F000000),
                                blurRadius: 20,
                                offset: Offset(0, -1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(alignment: Alignment.center, children: [
                            const Positioned(
                              right: 10,
                              top: 10,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/images/doctor_image_1.jpg",
                                      width: 84,
                                      height: 84,
                                    ),
                                  ),
                                  const Text(
                                    'Dr. Shouey',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 15,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  const Text(
                                    'Specalist Cardiology',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7E),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          width: 160,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0F000000),
                                blurRadius: 20,
                                offset: Offset(0, -1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(alignment: Alignment.center, children: [
                            const Positioned(
                              right: 10,
                              top: 10,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/images/doctor_image_1.jpg",
                                      width: 84,
                                      height: 84,
                                    ),
                                  ),
                                  const Text(
                                    'Dr. Shouey',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 15,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  const Text(
                                    'Specalist Cardiology',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7E),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          width: 160,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0F000000),
                                blurRadius: 20,
                                offset: Offset(0, -1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(alignment: Alignment.center, children: [
                            const Positioned(
                              right: 10,
                              top: 10,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/images/doctor_image_1.jpg",
                                      width: 84,
                                      height: 84,
                                    ),
                                  ),
                                  const Text(
                                    'Dr. Shouey',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 15,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  const Text(
                                    'Specalist Cardiology',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7E),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          width: 160,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0F000000),
                                blurRadius: 20,
                                offset: Offset(0, -1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(alignment: Alignment.center, children: [
                            const Positioned(
                              right: 10,
                              top: 10,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/images/doctor_image_1.jpg",
                                      width: 84,
                                      height: 84,
                                    ),
                                  ),
                                  const Text(
                                    'Dr. Shouey',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 15,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  const Text(
                                    'Specalist Cardiology',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7E),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          width: 160,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0F000000),
                                blurRadius: 20,
                                offset: Offset(0, -1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(alignment: Alignment.center, children: [
                            const Positioned(
                              right: 10,
                              top: 10,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/images/doctor_image_1.jpg",
                                      width: 84,
                                      height: 84,
                                    ),
                                  ),
                                  const Text(
                                    'Dr. Shouey',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 15,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  const Text(
                                    'Specalist Cardiology',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7E),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(0, 30, 20, 20),
                    child: Row(
                      children: [
                        const Text(
                          'Feature Doctor',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 18,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.30,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.all(0)),
                          onPressed: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              color: Color(0xFF677294),
                              fontSize: 12,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w300,
                              letterSpacing: -0.30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                            width: 96,
                            height: 130,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x0F000000),
                                  blurRadius: 20,
                                  offset: Offset(0, -1),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 8.58, 0, 0),
                                          onPressed: () {},
                                          style: IconButton.styleFrom(),
                                          icon: const Icon(
                                              size: 20, Icons.favorite_border)),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 9, 6, 0),
                                        child: SvgPicture.asset(
                                            "assets/images/star.svg"),
                                      ),
                                      const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 9, 9, 0),
                                          child: SizedBox(
                                            width: 14,
                                            height: 9,
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '3.7',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.30,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' ',
                                                    style: TextStyle(
                                                      color: Color(0xFF677294),
                                                      fontSize: 10,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: const ShapeDecoration(
                                    shape: OvalBorder(),
                                  ),
                                  child: Image.asset(
                                      "assets/images/featuerd_doctor.jpg"),
                                ),
                                const Text(
                                  'Dr. Crick',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 12,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$ ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7E),
                                          fontSize: 9,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '25.00/ hours',
                                        style: TextStyle(
                                          color: Color(0xFF677294),
                                          fontSize: 9,
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
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                            width: 96,
                            height: 130,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x0F000000),
                                  blurRadius: 20,
                                  offset: Offset(0, -1),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 8.58, 0, 0),
                                          onPressed: () {},
                                          style: IconButton.styleFrom(),
                                          icon: const Icon(
                                              size: 20, Icons.favorite_border)),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 9, 6, 0),
                                        child: SvgPicture.asset(
                                            "assets/images/star.svg"),
                                      ),
                                      const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 9, 9, 0),
                                          child: SizedBox(
                                            width: 14,
                                            height: 9,
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '3.7',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.30,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' ',
                                                    style: TextStyle(
                                                      color: Color(0xFF677294),
                                                      fontSize: 10,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: const ShapeDecoration(
                                    shape: OvalBorder(),
                                  ),
                                  child: Image.asset(
                                      "assets/images/featuerd_doctor.jpg"),
                                ),
                                const Text(
                                  'Dr. Crick',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 12,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$ ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7E),
                                          fontSize: 9,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '25.00/ hours',
                                        style: TextStyle(
                                          color: Color(0xFF677294),
                                          fontSize: 9,
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
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                            width: 96,
                            height: 130,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x0F000000),
                                  blurRadius: 20,
                                  offset: Offset(0, -1),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 8.58, 0, 0),
                                          onPressed: () {},
                                          style: IconButton.styleFrom(),
                                          icon: const Icon(
                                              size: 20, Icons.favorite_border)),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 9, 6, 0),
                                        child: SvgPicture.asset(
                                            "assets/images/star.svg"),
                                      ),
                                      const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 9, 9, 0),
                                          child: SizedBox(
                                            width: 14,
                                            height: 9,
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '3.7',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.30,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' ',
                                                    style: TextStyle(
                                                      color: Color(0xFF677294),
                                                      fontSize: 10,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: const ShapeDecoration(
                                    shape: OvalBorder(),
                                  ),
                                  child: Image.asset(
                                      "assets/images/featuerd_doctor.jpg"),
                                ),
                                const Text(
                                  'Dr. Crick',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 12,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$ ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7E),
                                          fontSize: 9,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '25.00/ hours',
                                        style: TextStyle(
                                          color: Color(0xFF677294),
                                          fontSize: 9,
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
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                            width: 96,
                            height: 130,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x0F000000),
                                  blurRadius: 20,
                                  offset: Offset(0, -1),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 8.58, 0, 0),
                                          onPressed: () {},
                                          style: IconButton.styleFrom(),
                                          icon: const Icon(
                                              size: 20, Icons.favorite_border)),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 9, 6, 0),
                                        child: SvgPicture.asset(
                                            "assets/images/star.svg"),
                                      ),
                                      const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 9, 9, 0),
                                          child: SizedBox(
                                            width: 14,
                                            height: 9,
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '3.7',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.30,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' ',
                                                    style: TextStyle(
                                                      color: Color(0xFF677294),
                                                      fontSize: 10,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: const ShapeDecoration(
                                    shape: OvalBorder(),
                                  ),
                                  child: Image.asset(
                                      "assets/images/featuerd_doctor.jpg"),
                                ),
                                const Text(
                                  'Dr. Crick',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 12,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$ ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7E),
                                          fontSize: 9,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '25.00/ hours',
                                        style: TextStyle(
                                          color: Color(0xFF677294),
                                          fontSize: 9,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ]));
  }
}
