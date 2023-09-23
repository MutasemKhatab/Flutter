import 'dart:ui';

import 'package:flutter/material.dart';

class PatientDetailsInput extends StatelessWidget {
  const PatientDetailsInput({Key? key}) : super(key: key);

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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 36, 0, 24),
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
                        'Patient Details',
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
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Step 1/4',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(15),
                          value: 0.25,
                          backgroundColor: const Color(0x4C0EBE7F),
                          color: const Color(0xFF0EBE7F),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 35),
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Patient’s Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          height: 0.12,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        padding: const EdgeInsets.fromLTRB(20, 17, 20, 17),
                        height: 54,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0x28677294)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: TextField(
                            onTapOutside: (event) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            style: const TextStyle(
                              color: Color(0xFF677294),
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w300,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                            decoration: const InputDecoration.collapsed(
                                hintText: "Name")),
                      ),
                      const Text(
                        'Age',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          height: 0.12,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 55,
                            padding: const EdgeInsets.fromLTRB(10, 16, 0, 16),
                            margin: const EdgeInsets.fromLTRB(0, 10, 10, 20),
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Color(0x28677294), width: 1),
                                    borderRadius: BorderRadius.circular(6))),
                            child: DropdownButton(
                              underline: Container(),
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              items: const [
                                DropdownMenuItem(child: Text("Day      "))
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.fromLTRB(10, 16, 0, 16),
                            margin: const EdgeInsets.fromLTRB(0, 10, 10, 20),
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Color(0x28677294), width: 1),
                                    borderRadius: BorderRadius.circular(6))),
                            child: DropdownButton(
                              underline: Container(),
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              items: const [
                                DropdownMenuItem(child: Text("Month      "))
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.fromLTRB(10, 16, 0, 16),
                            margin: const EdgeInsets.fromLTRB(0, 10, 10, 20),
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Color(0x28677294), width: 1),
                                    borderRadius: BorderRadius.circular(6))),
                            child: DropdownButton(
                              underline: Container(),
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              items: const [
                                DropdownMenuItem(child: Text("Year      "))
                              ],
                              onChanged: (value) {},
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Gender',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          height: 0.12,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              activeColor: const Color(0xFF0EBE7F),
                              value: 1,
                              groupValue: "Gender",
                              onChanged: (value) {}),
                          const Text(
                            'Male',
                            style: TextStyle(
                              color: Color(0xFF677294),
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w300,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                          Radio(
                              activeColor: const Color(0xFF0EBE7F),
                              value: 2,
                              groupValue: "Gender",
                              onChanged: (value) {}),
                          const Text(
                            'Female ☕',
                            style: TextStyle(
                              color: Color(0xFF677294),
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w300,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                          Radio(
                              activeColor: const Color(0xFF0EBE7F),
                              value: 3,
                              groupValue: "Gender",
                              onChanged: (value) {}),
                          const Text(
                            'خول',
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
                      const SizedBox(
                        height: 17,
                      ),
                      const Text(
                        'Mobile Number',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          height: 0.12,
                          letterSpacing: -0.30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.fromLTRB(20, 17, 20, 17),
                        height: 54,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0x28677294)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: TextField(
                            keyboardType: TextInputType.number,
                            onTapOutside: (event) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            style: const TextStyle(
                              color: Color(0xFF677294),
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w300,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                            decoration: const InputDecoration.collapsed(
                                hintText: "Mobile")),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          height: 0.12,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.fromLTRB(20, 17, 20, 17),
                        height: 54,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0x28677294)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          onTapOutside: (event) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          style: const TextStyle(
                            color: Color(0xFF677294),
                            fontSize: 16,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: -0.30,
                          ),
                          decoration: const InputDecoration.collapsed(
                              hintText: "Email"),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(270, 55),
                        backgroundColor: const Color(0xFF0EBE7F)),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
