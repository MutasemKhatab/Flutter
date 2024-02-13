import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrakeInterst extends StatelessWidget {
  const TrakeInterst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Text(
            'Track interest earnings',
            style: GoogleFonts.cairo(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                'Interest Due Date',
                style: GoogleFonts.cairo(fontSize: 20),
              ),
              Text(
                'Interest Value',
                style: GoogleFonts.cairo(fontSize: 20),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
