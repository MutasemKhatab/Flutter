import 'dart:ui';

import 'package:flutter/material.dart';

class MyDoctors extends StatelessWidget {
  const MyDoctors({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.fromLTRB(20, 36, 0, 34),
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
                        'My Doctors',
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
                  width: MediaQuery.of(context).size.width,
                  //TODO auto scroll view size
                  height: MediaQuery.of(context).size.height - 178,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          height: 170,
                          padding: const EdgeInsets.all(18),
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
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 92,
                                    height: 87,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        fit: BoxFit.cover,
                                        "assets/images/live_doctor.jpeg",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Dr. Tranquilli',
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
                                        Text(
                                          'Specilist medicine',
                                          style: TextStyle(
                                            color: Color(0xFF0EBE7F),
                                            fontSize: 13,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                        Text(
                                          '6 Years experience ',
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
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 87%',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            SizedBox(width: 17),
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 69 Patient Stories',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Next Available ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7F),
                                          fontSize: 13,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '10:00',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' AM tomorrow',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                                  const Spacer(),
                                  SizedBox(
                                    height: 34,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF0EBE7F),
                                          fixedSize: const Size(112, 34)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Book Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          height: 170,
                          padding: const EdgeInsets.all(18),
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
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 92,
                                    height: 87,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        fit: BoxFit.cover,
                                        "assets/images/live_doctor.jpeg",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Dr. Tranquilli',
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
                                        Text(
                                          'Specilist medicine',
                                          style: TextStyle(
                                            color: Color(0xFF0EBE7F),
                                            fontSize: 13,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                        Text(
                                          '6 Years experience ',
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
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 87%',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            SizedBox(width: 17),
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 69 Patient Stories',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Next Available ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7F),
                                          fontSize: 13,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '10:00',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' AM tomorrow',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                                  const Spacer(),
                                  SizedBox(
                                    height: 34,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF0EBE7F),
                                          fixedSize: const Size(112, 34)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Book Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          height: 170,
                          padding: const EdgeInsets.all(18),
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
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 92,
                                    height: 87,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        fit: BoxFit.cover,
                                        "assets/images/live_doctor.jpeg",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Dr. Tranquilli',
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
                                        Text(
                                          'Specilist medicine',
                                          style: TextStyle(
                                            color: Color(0xFF0EBE7F),
                                            fontSize: 13,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                        Text(
                                          '6 Years experience ',
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
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 87%',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            SizedBox(width: 17),
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 69 Patient Stories',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Next Available ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7F),
                                          fontSize: 13,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '10:00',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' AM tomorrow',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                                  const Spacer(),
                                  SizedBox(
                                    height: 34,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF0EBE7F),
                                          fixedSize: const Size(112, 34)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Book Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          height: 170,
                          padding: const EdgeInsets.all(18),
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
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 92,
                                    height: 87,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        fit: BoxFit.cover,
                                        "assets/images/live_doctor.jpeg",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Dr. Tranquilli',
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
                                        Text(
                                          'Specilist medicine',
                                          style: TextStyle(
                                            color: Color(0xFF0EBE7F),
                                            fontSize: 13,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                        Text(
                                          '6 Years experience ',
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
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 87%',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            SizedBox(width: 17),
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 69 Patient Stories',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Next Available ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7F),
                                          fontSize: 13,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '10:00',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' AM tomorrow',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                                  const Spacer(),
                                  SizedBox(
                                    height: 34,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF0EBE7F),
                                          fixedSize: const Size(112, 34)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Book Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          height: 170,
                          padding: const EdgeInsets.all(18),
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
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 92,
                                    height: 87,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        fit: BoxFit.cover,
                                        "assets/images/live_doctor.jpeg",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Dr. Tranquilli',
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
                                        Text(
                                          'Specilist medicine',
                                          style: TextStyle(
                                            color: Color(0xFF0EBE7F),
                                            fontSize: 13,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                        Text(
                                          '6 Years experience ',
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
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 87%',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            SizedBox(width: 17),
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 69 Patient Stories',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Next Available ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7F),
                                          fontSize: 13,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '10:00',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' AM tomorrow',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                                  const Spacer(),
                                  SizedBox(
                                    height: 34,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF0EBE7F),
                                          fixedSize: const Size(112, 34)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Book Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          height: 170,
                          padding: const EdgeInsets.all(18),
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
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 92,
                                    height: 87,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        fit: BoxFit.cover,
                                        "assets/images/live_doctor.jpeg",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Dr. Tranquilli',
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
                                        Text(
                                          'Specilist medicine',
                                          style: TextStyle(
                                            color: Color(0xFF0EBE7F),
                                            fontSize: 13,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                        Text(
                                          '6 Years experience ',
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
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 87%',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            SizedBox(width: 17),
                                            Icon(
                                              Icons.circle,
                                              color: Color(0xFF0EBE7F),
                                              size: 12,
                                            ),
                                            Text(
                                              ' 69 Patient Stories',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 11,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Next Available ',
                                        style: TextStyle(
                                          color: Color(0xFF0EBE7F),
                                          fontSize: 13,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '10:00',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' AM tomorrow',
                                              style: TextStyle(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                                  const Spacer(),
                                  SizedBox(
                                    height: 34,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF0EBE7F),
                                          fixedSize: const Size(112, 34)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Book Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
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
          )
        ],
      ),
    );
  }
}
