import 'package:bank/helpers/octagon.dart';
import 'package:bank/screens/investment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        const SizedBox(width: double.infinity, height: double.infinity),
        Positioned(
            top: -70,
            left: -70,
            child: SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: OctagonPainter(),
              ),
            )),
        Positioned(
            top: 20,
            left: 50,
            child: SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: OctagonPainter(),
              ),
            )),
        Positioned(
            top: 100,
            left: 175,
            child: SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: OctagonPainter(),
              ),
            )),
        Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/home_pic.png',
              width: 400,
              height: 450,
            )),
        Positioned(
          top: 45,
          left: 45,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Investment(),
                  ));
            },
            child: Text(
              'Client\nName',
              style: GoogleFonts.cairo(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ),
        ),
        Positioned(
          top: 130,
          left: 150,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Client\nBusiness',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ),
        ),
        Positioned(
          top: 210,
          left: 280,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Client\nBanking',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
