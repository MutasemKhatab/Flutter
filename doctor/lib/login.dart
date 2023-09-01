import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Welcome back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.30,
                    ),
                  ),
                  const Text(
                    'You can search c ourse, apply course and find scholarship for abroad studies',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF677294),
                      fontSize: 14,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                      height: 1.66,
                      letterSpacing: -0.30,
                    ),
                  ),
                  const SizedBox(height: 75),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160,
                        height: 54,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x0F000000),
                              blurRadius: 22,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/Google.svg",
                              height: 18,
                              width: 18,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            const Text(
                              'Google',
                              style: TextStyle(
                                color: Color(0xFF677294),
                                fontSize: 16,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.30,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 54,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x0F000000),
                              blurRadius: 22,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/Facebook.svg",
                              height: 18,
                              width: 18,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            const Text(
                              'Facebook',
                              style: TextStyle(
                                color: Color(0xFF677294),
                                fontSize: 16,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.30,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0x28677294)),
                          borderRadius: BorderRadius.circular(4),
                        )),
                    height: 54,
                    child: const Center(
                      child: TextField(
                        style: TextStyle(
                          backgroundColor: Colors.transparent,
                          color: Color(0xFF677294),
                          fontSize: 16,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.30,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0x28677294)),
                          borderRadius: BorderRadius.circular(4),
                        )),
                    height: 54,
                    child: const Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: TextStyle(
                                backgroundColor: Colors.transparent,
                                color: Color(0xFF677294),
                                fontSize: 16,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.30,
                              ),
                              decoration: InputDecoration.collapsed(
                                hintText: "Password",
                              ),
                            ),
                          ),
                          Icon(Icons.remove_red_eye)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //No effect button
                      splashFactory: NoSplash.splashFactory,
                      shadowColor: Colors.transparent,
                      backgroundColor: const Color(0xFF0EBE7F),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      fixedSize: const Size(295, 54),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent)),
                    onPressed: () {},
                    child: const Text(
                      'Forgot password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0EBE7F),
                        fontSize: 14,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 120),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent)),
                    onPressed: () {},
                    child: const Text(
                      'Dont have an account? Join us',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0EBE7F),
                        fontSize: 14,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
