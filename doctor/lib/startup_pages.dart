import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO add animation google fonts cause exception
class StartupPages extends StatefulWidget {
  const StartupPages({Key? key}) : super(key: key);

  @override
  State<StartupPages> createState() => _StartupPagesState();
}

class _StartupPagesState extends State<StartupPages> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -53,
          bottom: -45,
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
            sigmaX: 50.0,
            sigmaY: 50.0,
          ),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Positioned(
            top: -20,
            left: -104,
            child: Container(
              width: 342,
              height: 342,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.98, -0.19),
                  end: Alignment(-0.98, 0.19),
                  colors: [Color(0xFF0EBE7E), Color(0xFF07D9AD)],
                ),
                shape: OvalBorder(),
              ),
            )),
        Positioned(
          top: 91,
          right: 20,
          left: 20,
          child: pages[counter].image,
        ),
        Positioned(
          // TODO get the device width and devide by 2 to center this widget
          right: 49,
          left: 49,
          top: 512,
          child: Column(children: [
            Text(
              pages[counter].title,
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                color: const Color(0xFF333333),
                fontSize: 28,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.30,
              ),
            ),
            Text(
              pages[counter].body,
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                color: const Color(0xE5677294),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.66,
                letterSpacing: -0.30,
              ),
            ),
            const SizedBox(
              height: 52,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.transparent,
                  fixedSize: const Size(295, 54),
                  backgroundColor: const Color(0xFF0EBE7F)),
              onPressed: () {
                setState(() {
                  if (counter < 2) {
                    counter++;
                  } else {
                    //TODO nav to menu page
                  }
                });
              },
              child: Text(
                pages[counter].eBtn,
                style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    shadows: null),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  counter = 3;
                });
              },
              child: Text(
                pages[counter].tBtn,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  color: const Color(0xFF677294),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.66,
                  letterSpacing: -0.30,
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class StartupInfo {
  StartupInfo(this.title, this.body, this.eBtn, this.tBtn, this.image);
  final String title;
  final String body;
  final String eBtn;
  final String tBtn;
  final Image image;
}

final List<StartupInfo> pages = [
  StartupInfo(
      "Find Trusted Doctors",
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
      "Next",
      "Skip",
      Image.asset("assets/images/doctor_image_1.jpg")),
  StartupInfo(
      "Choose Best Doctors",
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
      "Next",
      "Skip",
      Image.asset("assets/images/doctor_image_2.jpg")),
  StartupInfo(
      "Find Trusted Doctors",
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
      "Get Started",
      "Skip",
      Image.asset("assets/images/doctor_image_3.jpg")),
];
