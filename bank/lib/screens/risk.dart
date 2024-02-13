import 'package:bank/screens/cost.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Risk extends StatelessWidget {
  const Risk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                  left: 0,
                  child: Container(
                    width: size / 3,
                    height: height,
                    color: Colors.amber,
                  )),
              Positioned(
                  left: size / 3,
                  child: Container(
                    width: size / 3,
                    height: height,
                    color: Colors.black,
                  )),
              Positioned(
                  left: 2 * size / 3,
                  child: Container(
                    width: size / 3,
                    height: height,
                    color: Colors.amber,
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Cost(),
                      )),
                  child: Text(
                    'Risk Management Tools',
                    style: GoogleFonts.cairo(fontSize: 23, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Evaluation of investment risks :',
                style: GoogleFonts.cairo(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Investment risk',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' = ( ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Market risk',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' * ',
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Market risk weight',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' ) ',
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    ' + ( ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Credit risk',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' * ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Credit risk weight',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' )+( ',
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Liquidity risk',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    ' * ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Liquidity risk weight',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' )= ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Result',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'A variable that reflects investors’ expectations for economic ',
                style: GoogleFonts.cairo(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Investment risk',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' = ( ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Market risk',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' * ',
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Market risk weight',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' ) ',
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    ' + ( ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Credit risk',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' * ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Credit risk weight',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' )+( ',
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Liquidity risk',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    ' * ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Liquidity\nrisk weight',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' )+( ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Economic growth\nexpectation',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' * ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Economic growth\nexpectations weight',
                      style: GoogleFonts.cairo(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    ' )= ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Result',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Interest rates :',
                style: GoogleFonts.cairo(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Investment risk',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' = ',
                    style: GoogleFonts.cairo(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Supply of money',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Text(
                    ' / ',
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text(
                      'Demand for\nmoney',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
