import 'package:bank/screens/identifying.dart';
import 'package:bank/screens/analyze.dart';
import 'package:bank/screens/trake_interst.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intrest extends StatelessWidget {
  const Intrest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
            width: double.infinity,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Analyze(),
                  ));
            },
            child: Container(
              width: 400,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Text(
                'Analyze individual investment performance',
                style: GoogleFonts.cairo(fontSize: 20, color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TrakeInterst(),
                  ));
            },
            child: Container(
              width: 250,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Text(
                'Track interest earnings',
                style: GoogleFonts.cairo(fontSize: 20, color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Identifying(),
                  ));
            },
            child: Container(
              width: 350,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Text(
                'Identifying potential and delinquency',
                style: GoogleFonts.cairo(fontSize: 20, color: Colors.blue),
              ),
            ),
          ),
          Image.asset(
            'assets/intrest.png',
            height: 450,
          )
        ],
      ),
    );
  }
}
