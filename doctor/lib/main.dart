// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace, avoid_types_as_parameter_names, non_constant_identifier_names, avoid_unnecessary_containers

import 'dart:ui';
import 'package:doctor/booking.dart';
import 'package:doctor/doctor_details.dart';
import 'package:doctor/favourite_doctors.dart';
import 'package:doctor/find_doctors.dart';
import 'package:doctor/login.dart';
import 'package:doctor/main_page.dart';
import 'package:doctor/medical_records.dart';
import 'package:doctor/my_doctors.dart';
import 'package:doctor/popular_doctors.dart';
import 'package:doctor/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'add_record.dart';
import 'live_page.dart';

//TODO  add fontfamily rubik add indexd package
//overflow when use sized container

void main() => runApp(MaterialApp(home: Main()));

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.fromLTRB(20, 36, 0, 38),
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
                        'All Records',
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
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 110,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            shadows: [
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
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    height: 60,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF0EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: Text(
                                      '27\nFEB',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 55,
                                    height: 22,
                                    decoration: ShapeDecoration(
                                      color: Color(0x190EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              'Records added by you',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.more_vert,
                                          color: Color(0xFF677294),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Record for Abdullah mamun',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      '1 Prescription',
                                      style: TextStyle(
                                        color: Color(0xFF677294),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 110,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            shadows: [
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
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    height: 60,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF0EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: Text(
                                      '27\nFEB',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 55,
                                    height: 22,
                                    decoration: ShapeDecoration(
                                      color: Color(0x190EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              'Records added by you',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.more_vert,
                                          color: Color(0xFF677294),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Record for Abdullah mamun',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      '1 Prescription',
                                      style: TextStyle(
                                        color: Color(0xFF677294),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 110,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            shadows: [
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
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    height: 60,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF0EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: Text(
                                      '27\nFEB',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 55,
                                    height: 22,
                                    decoration: ShapeDecoration(
                                      color: Color(0x190EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              'Records added by you',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.more_vert,
                                          color: Color(0xFF677294),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Record for Abdullah mamun',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      '1 Prescription',
                                      style: TextStyle(
                                        color: Color(0xFF677294),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 110,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            shadows: [
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
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    height: 60,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF0EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: Text(
                                      '27\nFEB',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 55,
                                    height: 22,
                                    decoration: ShapeDecoration(
                                      color: Color(0x190EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              'Records added by you',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.more_vert,
                                          color: Color(0xFF677294),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Record for Abdullah mamun',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      '1 Prescription',
                                      style: TextStyle(
                                        color: Color(0xFF677294),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 110,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            shadows: [
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
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    height: 60,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF0EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: Text(
                                      '27\nFEB',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 55,
                                    height: 22,
                                    decoration: ShapeDecoration(
                                      color: Color(0x190EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              'Records added by you',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.more_vert,
                                          color: Color(0xFF677294),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Record for Abdullah mamun',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      '1 Prescription',
                                      style: TextStyle(
                                        color: Color(0xFF677294),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 110,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            shadows: [
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
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    height: 60,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF0EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: Text(
                                      '27\nFEB',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 55,
                                    height: 22,
                                    decoration: ShapeDecoration(
                                      color: Color(0x190EBE7F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              'Records added by you',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.more_vert,
                                          color: Color(0xFF677294),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Record for Abdullah mamun',
                                      style: TextStyle(
                                        color: Color(0xFF0EBE7F),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      '1 Prescription',
                                      style: TextStyle(
                                        color: Color(0xFF677294),
                                        fontSize: 12,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
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
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(270, 50),
                        backgroundColor: Color(0xFF0EBE7F)),
                    onPressed: () {},
                    child: Text(
                      'Add a record',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
