import 'package:bank/screens/customer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Identifying extends StatelessWidget {
  const Identifying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Customer(),
                    ));
              },
              child: Text(
                'Analyze individual investment performance',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Delinquency value',
                    style: GoogleFonts.cairo(fontSize: 20),
                  ),
                ),
                Text(
                  '  =  ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Current value',
                    style: GoogleFonts.cairo(fontSize: 20),
                  ),
                ),
                Text(
                  '  -  ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Book value',
                    style: GoogleFonts.cairo(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  '  =                  ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Result',
                    style: GoogleFonts.cairo(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Note:',
                style: GoogleFonts.cairo(color: Colors.white, fontSize: 20),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'The purpose of negative value is a decreasein market prices and the value of the  underlying assets of the investments and vice versa',
                style: GoogleFonts.cairo(color: Colors.amber, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
