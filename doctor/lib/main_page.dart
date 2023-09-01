import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          width: 375,
          height: 74,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 180,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              onPressed: () {},
              icon: Container(
                width: 48,
                height: 48,
                decoration: const ShapeDecoration(
                  color: Color(0xFF0EBE7E),
                  shape: OvalBorder(),
                ),
                child: const Icon(
                  Icons.home,
                ),
              ),
              color: const Color.fromARGB(255, 255, 255, 255),
              style: IconButton.styleFrom(
                shape: const OvalBorder(),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  size: 23,
                  color: Color(0xFF858EA9),
                )),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_book_sharp,
                size: 23,
                color: Color(0xFF858EA9),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.message_sharp,
                  size: 23,
                  color: Color(0xFF858EA9),
                ))
          ]),
        ),
        body: Stack(
          children: [
            const Column(),
            Positioned(
              top: 148,
              left: -102,
              child: Container(
                width: 216,
                height: 216,
                decoration: const ShapeDecoration(
                  color: Color(0xB760CDFF),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              bottom: -10,
              right: -55,
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
              filter: ImageFilter.blur(
                sigmaX: 1000.0,
                sigmaY: 1000.0,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Positioned(
              child: Stack(children: [
                Container(
                  height: 156,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    gradient: LinearGradient(
                      end: Alignment(0.98, -0.19),
                      begin: Alignment(-0.98, 0.19),
                      colors: [Color(0xFF0EBE7E), Color(0xFF07D9AD)],
                    ),
                  ),
                ),
              ]),
            ),
            const Positioned(
              top: 47,
              left: 19,
              child: Text(
                'Hi Handwerker! ',
                style: TextStyle(
                  color: Color(0xFFF9F9F9),
                  fontSize: 20,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.30,
                ),
              ),
            ),
            const Positioned(
              top: 75,
              left: 19,
              child: Text(
                'Find Your Doctor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.30,
                ),
              ),
            ),
            Positioned(
              top: 36,
              right: 20,
              child: Image.asset("assets/images/profile_pic.jpg"),
            ),
            Positioned(
              top: 126,
              left: 20,
              right: 20,
              child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: Color(0x14000000),
                          offset: Offset(0, 0),
                          spreadRadius: 0)
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                width: 335,
                height: 54,
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
            ),
            Positioned(
              height: MediaQuery.of(context).size.height - 284,
              top: 210,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        'Live Doctors',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 21,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 168,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                decoration: ShapeDecoration(
                                    color: Colors.black
                                        .withOpacity(0.20000000298023224),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)))),
                                height: 168,
                                width: 116,
                                child: Stack(
                                  children: [
                                    Material(
                                      child: InkWell(
                                          onTap: () {},
                                          child: Ink.image(
                                            padding: const EdgeInsets.all(0),
                                            fit: BoxFit.fitHeight,
                                            image: const AssetImage(
                                              "assets/images/live_doctor1.png",
                                            ),
                                          )),
                                    ),
                                    const Positioned(
                                        top: 83,
                                        left: 44,
                                        bottom: 55,
                                        right: 43,
                                        child: Icon(
                                          Icons.play_circle_outline_outlined,
                                          color: Colors.white,
                                        )),
                                    Positioned(
                                      top: 11,
                                      right: 11,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 40.32,
                                        height: 17.92,
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFFF9002F),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                        ),
                                        child: const Text(
                                          '⚪ LIVE',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 7,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                decoration: ShapeDecoration(
                                    color: Colors.black
                                        .withOpacity(0.20000000298023224),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)))),
                                height: 168,
                                width: 116,
                                child: Stack(
                                  children: [
                                    Material(
                                      child: InkWell(
                                          onTap: () {},
                                          child: Ink.image(
                                            padding: const EdgeInsets.all(0),
                                            fit: BoxFit.fitHeight,
                                            image: const AssetImage(
                                              "assets/images/live_doctor1.png",
                                            ),
                                          )),
                                    ),
                                    const Positioned(
                                        top: 83,
                                        left: 44,
                                        bottom: 55,
                                        right: 43,
                                        child: Icon(
                                          Icons.play_circle_outline_outlined,
                                          color: Colors.white,
                                        )),
                                    Positioned(
                                      top: 11,
                                      right: 11,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 40.32,
                                        height: 17.92,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF9002F),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                        ),
                                        child: const Text(
                                          '⚪ LIVE',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 7,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                decoration: ShapeDecoration(
                                    color: Colors.black
                                        .withOpacity(0.20000000298023224),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)))),
                                height: 168,
                                width: 116,
                                child: Stack(
                                  children: [
                                    Material(
                                      child: InkWell(
                                          onTap: () {},
                                          child: Ink.image(
                                            padding: const EdgeInsets.all(0),
                                            fit: BoxFit.fitHeight,
                                            image: const AssetImage(
                                              "assets/images/live_doctor1.png",
                                            ),
                                          )),
                                    ),
                                    const Positioned(
                                        top: 83,
                                        left: 44,
                                        bottom: 55,
                                        right: 43,
                                        child: Icon(
                                          Icons.play_circle_outline_outlined,
                                          color: Colors.white,
                                        )),
                                    Positioned(
                                      top: 11,
                                      right: 11,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 40.32,
                                        height: 17.92,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF9002F),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                        ),
                                        child: const Text(
                                          '⚪ LIVE',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 7,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                decoration: ShapeDecoration(
                                    color: Colors.black
                                        .withOpacity(0.20000000298023224),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)))),
                                height: 168,
                                width: 116,
                                child: Stack(
                                  children: [
                                    Material(
                                      child: InkWell(
                                          onTap: () {},
                                          child: Ink.image(
                                            padding: const EdgeInsets.all(0),
                                            fit: BoxFit.fitHeight,
                                            image: const AssetImage(
                                              "assets/images/live_doctor1.png",
                                            ),
                                          )),
                                    ),
                                    const Positioned(
                                        top: 83,
                                        left: 44,
                                        bottom: 55,
                                        right: 43,
                                        child: Icon(
                                          Icons.play_circle_outline_outlined,
                                          color: Colors.white,
                                        )),
                                    Positioned(
                                      top: 11,
                                      right: 11,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 40.32,
                                        height: 17.92,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF9002F),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                        ),
                                        child: const Text(
                                          '⚪ LIVE',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 7,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 119,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                                width: 80,
                                height: 119,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: 113,
                                        height: 119,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 80,
                                                height: 90,
                                                decoration: ShapeDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin:
                                                        Alignment(0.59, -0.81),
                                                    end: Alignment(-0.59, 0.81),
                                                    colors: [
                                                      Color(0xFF2753F3),
                                                      Color(0xFF765AFC)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                                child: SvgPicture.asset(
                                                  "assets/images/teeth.svg",
                                                  fit: BoxFit.none,
                                                  alignment: Alignment.topLeft,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 39,
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white
                                                      .withOpacity(
                                                          0.03999999910593033),
                                                  shape: const OvalBorder(),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 46,
                                              top: 0,
                                              child: Container(
                                                width: 67,
                                                height: 67,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white
                                                      .withOpacity(
                                                          0.05999999865889549),
                                                  shape: const OvalBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                                width: 80,
                                height: 119,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: 113,
                                        height: 119,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 80,
                                                height: 90,
                                                decoration: ShapeDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin:
                                                        Alignment(0.59, -0.81),
                                                    end: Alignment(-0.59, 0.81),
                                                    colors: [
                                                      Color(0xFF0EBE7E),
                                                      Color(0xFF07D9AD)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                                child: SvgPicture.asset(
                                                  "assets/images/heart.svg",
                                                  fit: BoxFit.none,
                                                  alignment: Alignment.topLeft,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 39,
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white
                                                      .withOpacity(
                                                          0.03999999910593033),
                                                  shape: const OvalBorder(),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 46,
                                              top: 0,
                                              child: Container(
                                                width: 67,
                                                height: 67,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white
                                                      .withOpacity(
                                                          0.05999999865889549),
                                                  shape: const OvalBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                                width: 80,
                                height: 119,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: 113,
                                        height: 119,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 80,
                                                height: 90,
                                                decoration: ShapeDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin:
                                                        Alignment(0.59, -0.81),
                                                    end: Alignment(-0.59, 0.81),
                                                    colors: [
                                                      Color(0xFFFD7F43),
                                                      Color(0xFFFFCF68)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                                child: SvgPicture.asset(
                                                  "assets/images/eye.svg",
                                                  fit: BoxFit.none,
                                                  alignment: Alignment.topLeft,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 39,
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white
                                                      .withOpacity(
                                                          0.03999999910593033),
                                                  shape: const OvalBorder(),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 46,
                                              top: 0,
                                              child: Container(
                                                width: 67,
                                                height: 67,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white
                                                      .withOpacity(
                                                          0.05999999865889549),
                                                  shape: const OvalBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                                width: 80,
                                height: 119,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: 113,
                                        height: 119,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 80,
                                                height: 90,
                                                decoration: ShapeDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin:
                                                        Alignment(0.59, -0.81),
                                                    end: Alignment(-0.59, 0.81),
                                                    colors: [
                                                      Color(0xFFFF484C),
                                                      Color(0xFFFF6C60)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                                child: SvgPicture.asset(
                                                  "assets/images/body.svg",
                                                  fit: BoxFit.none,
                                                  alignment: Alignment.topLeft,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 39,
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white
                                                      .withOpacity(
                                                          0.03999999910593033),
                                                  shape: const OvalBorder(),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 46,
                                              top: 0,
                                              child: Container(
                                                width: 67,
                                                height: 67,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white
                                                      .withOpacity(
                                                          0.05999999865889549),
                                                  shape: const OvalBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                      child: Row(
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
                          const Spacer(),
                          TextButton(
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
                              width: 190,
                              height: 264,
                              margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    blurRadius: 40,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 190,
                                    height: 180,
                                    decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(2),
                                          bottomRight: Radius.circular(2),
                                        ),
                                      ),
                                    ),
                                    child: Image.asset(
                                        "assets/images/popular_doctors.jpg"),
                                  ),
                                  const Text(
                                    'Dr. Fillerup Grab',
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 18,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  const Text(
                                    'Medicine Specialist',
                                    style: TextStyle(
                                      color: Color(0xCC677294),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 12,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                          ),
                                        ]),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 190,
                              height: 264,
                              margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    blurRadius: 40,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 190,
                                    height: 180,
                                    decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(2),
                                          bottomRight: Radius.circular(2),
                                        ),
                                      ),
                                    ),
                                    child: Image.asset(
                                        "assets/images/popular_doctors.jpg"),
                                  ),
                                  const Text(
                                    'Dr. Fillerup Grab',
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 18,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  const Text(
                                    'Medicine Specialist',
                                    style: TextStyle(
                                      color: Color(0xCC677294),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 12,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                          ),
                                        ]),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 190,
                              height: 264,
                              margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    blurRadius: 40,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 190,
                                    height: 180,
                                    decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(2),
                                          bottomRight: Radius.circular(2),
                                        ),
                                      ),
                                    ),
                                    child: Image.asset(
                                        "assets/images/popular_doctors.jpg"),
                                  ),
                                  const Text(
                                    'Dr. Fillerup Grab',
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 18,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  const Text(
                                    'Medicine Specialist',
                                    style: TextStyle(
                                      color: Color(0xCC677294),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 12,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                            colorFilter: const ColorFilter.mode(
                                                Colors.yellowAccent,
                                                BlendMode.srcIn),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/star.svg",
                                          ),
                                        ]),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                                size: 20,
                                                Icons.favorite_border)),
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
                                                        color:
                                                            Color(0xFF677294),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                                size: 20,
                                                Icons.favorite_border)),
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
                                                        color:
                                                            Color(0xFF677294),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                                size: 20,
                                                Icons.favorite_border)),
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
                                                        color:
                                                            Color(0xFF677294),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                                size: 20,
                                                Icons.favorite_border)),
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
                                                        color:
                                                            Color(0xFF677294),
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
                ),
              ),
            ),
          ],
        ));
  }
}
