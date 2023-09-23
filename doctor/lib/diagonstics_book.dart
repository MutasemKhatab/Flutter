import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiagonsticsBook extends StatelessWidget {
  const DiagonsticsBook({Key? key}) : super(key: key);

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
                      'Diagonstics Tests',
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
                const SizedBox(height: 20),
                const Text(
                  'Get Full body health checkups from the comfort of your home.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.30,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Upto 45% off + get 10% healthcash back',
                  style: TextStyle(
                    color: Color(0xFF0EBE7F),
                    fontSize: 14,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.30,
                  ),
                ),
                SizedBox(
                  height: 177,
                  child: GridView.count(
                    physics: const ScrollPhysics(),
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(0),
                    childAspectRatio: (140 / 70),
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 52,
                            width: 52,
                            decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.59, -0.81),
                                  end: Alignment(-0.59, 0.81),
                                  colors: [
                                    Color(0xFF2753F3),
                                    Color(0xFF765AFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: -15,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.03999999910593033),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  right: -5,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.03999999910593033),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(16),
                                  child: SvgPicture.asset(
                                    "assets/images/home.svg",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            // edit text new line thing
                            'Free home\nSample pickup',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                                overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 52,
                            width: 52,
                            decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.64, -0.77),
                                  end: Alignment(-0.64, 0.77),
                                  colors: [
                                    Color(0xFFFF484C),
                                    Color(0xFFFF6C60)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: -15,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                255, 255, 255, 255)
                                            .withOpacity(0.03999999910593033),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  right: -5,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.03999999910593033),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(16),
                                  child: SvgPicture.asset(
                                    "assets/images/call_center.svg",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            // edit text new line thing
                            'Free home\nSample pickup',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                                overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 52,
                            width: 52,
                            decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.61, -0.79),
                                  end: Alignment(-0.61, 0.79),
                                  colors: [
                                    Color(0xFFFD7F43),
                                    Color(0xFFFFCF68)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: -15,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.03999999910593033),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  right: -5,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.03999999910593033),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(16),
                                  child: SvgPicture.asset(
                                    "assets/images/report.svg",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            // edit text new line thing
                            'Free home\nSample pickup',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                                overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 52,
                            width: 52,
                            decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.98, -0.19),
                                  end: Alignment(-0.98, 0.19),
                                  colors: [
                                    Color(0xFF0EBE7E),
                                    Color(0xFF07D9AD)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: -15,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.03999999910593033),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  right: -5,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.03999999910593033),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(16),
                                  child: SvgPicture.asset(
                                    "assets/images/microscope.svg",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            // edit text new line thing
                            'Free home\nSample pickup',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                                overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Recommend for you',
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 18,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.30,
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 20,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  'Advanced Young Indian Health Checkup',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  'Ideal for individuals aged 21-40 years',
                                  style: TextStyle(
                                    color: Color(0xFF677294),
                                    fontSize: 14,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 0.80,
                                          color: Color(0xFF0EBE7F))),
                                  child: const Text(
                                    '69 tests included',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7F),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  "assets/images/diagonstics_doctor1.png",
                                  width: MediaQuery.of(context).size.width,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '\$ 358   ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                height: 0.09,
                                              ),
                                            ),
                                            Text(
                                              '\$ 330 ',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 16,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                height: 0.10,
                                              ),
                                            ),
                                            Text(
                                              '35% off\n',
                                              style: TextStyle(
                                                color: Color(0xFF0EBE7E),
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                height: 0.12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          '+ 10% Health cashback T&C',
                                          style: TextStyle(
                                            color: Color(0xFF677294),
                                            fontSize: 14,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w300,
                                            height: 0.12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF0EBE7F),
                                            fixedSize: const Size(110, 32)),
                                        onPressed: () {},
                                        child: const Text(
                                          'Book Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 20,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  'Advanced Young Indian Health Checkup',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  'Ideal for individuals aged 21-40 years',
                                  style: TextStyle(
                                    color: Color(0xFF677294),
                                    fontSize: 14,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 0.80,
                                          color: Color(0xFF0EBE7F))),
                                  child: const Text(
                                    '69 tests included',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7F),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  "assets/images/diagonstics_doctor2.png",
                                  width: MediaQuery.of(context).size.width,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '\$ 358   ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                height: 0.09,
                                              ),
                                            ),
                                            Text(
                                              '\$ 330 ',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 16,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                height: 0.10,
                                              ),
                                            ),
                                            Text(
                                              '35% off\n',
                                              style: TextStyle(
                                                color: Color(0xFF0EBE7E),
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                height: 0.12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          '+ 10% Health cashback T&C',
                                          style: TextStyle(
                                            color: Color(0xFF677294),
                                            fontSize: 14,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w300,
                                            height: 0.12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF0EBE7F),
                                            fixedSize: const Size(110, 32)),
                                        onPressed: () {},
                                        child: const Text(
                                          'Book Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 20,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  'Advanced Young Indian Health Checkup',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  'Ideal for individuals aged 21-40 years',
                                  style: TextStyle(
                                    color: Color(0xFF677294),
                                    fontSize: 14,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 0.80,
                                          color: Color(0xFF0EBE7F))),
                                  child: const Text(
                                    '69 tests included',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7F),
                                      fontSize: 12,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  "assets/images/diagonstics_doctor3.png",
                                  width: MediaQuery.of(context).size.width,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '\$ 358   ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                height: 0.09,
                                              ),
                                            ),
                                            Text(
                                              '\$ 330 ',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 16,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                height: 0.10,
                                              ),
                                            ),
                                            Text(
                                              '35% off\n',
                                              style: TextStyle(
                                                color: Color(0xFF0EBE7E),
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                height: 0.12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          '+ 10% Health cashback T&C',
                                          style: TextStyle(
                                            color: Color(0xFF677294),
                                            fontSize: 14,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w300,
                                            height: 0.12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF0EBE7F),
                                            fixedSize: const Size(110, 32)),
                                        onPressed: () {},
                                        child: const Text(
                                          'Book Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
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
