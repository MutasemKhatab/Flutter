import 'package:bank/screens/withdrawal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Automated extends StatelessWidget {
  const Automated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Withdrawal(),
                  ))  ,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Automated interest accrual',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Daily interest',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
                    'Daily Interest',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
                Text(
                  ' = ( ',
                  style: GoogleFonts.cairo(fontSize: 23),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Face Value',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
                Text(
                  ' * ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Interest Rate',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
                Text(
                  ' ) ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' / ',
                  style: GoogleFonts.cairo(fontSize: 23),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    '365',
                    style: GoogleFonts.cairo(fontSize: 18),
                  ),
                ),
                Text(
                  '  =  ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Results',
                    style: GoogleFonts.cairo(fontSize: 23),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Monthly interest',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
                    'Monthly Interest',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
                Text(
                  ' = ( ',
                  style: GoogleFonts.cairo(fontSize: 23),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Face Value',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
                Text(
                  ' * ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Interest Rate',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' * ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'days in the month',
                    style: GoogleFonts.cairo(fontSize: 14),
                  ),
                ),
                Text(
                  ' ) / ',
                  style: GoogleFonts.cairo(fontSize: 23),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    '365',
                    style: GoogleFonts.cairo(fontSize: 18),
                  ),
                ),
                Text(
                  '  =  ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Results',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Annual interest',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
                    'Monthly Interest',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
                Text(
                  ' = ( ',
                  style: GoogleFonts.cairo(fontSize: 23),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Face Value',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
                Text(
                  ' * ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Interest Rate',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' * ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'days in the year',
                    style: GoogleFonts.cairo(fontSize: 14),
                  ),
                ),
                Text(
                  ' ) / ',
                  style: GoogleFonts.cairo(fontSize: 23),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    '365',
                    style: GoogleFonts.cairo(fontSize: 18),
                  ),
                ),
                Text(
                  '  =  ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Results',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Accrued interest',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
                    'Monthly Interest',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
                Text(
                  ' = ( ',
                  style: GoogleFonts.cairo(fontSize: 23),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Face Value',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
                Text(
                  ' * ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Interest Rate',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' * ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Maturity period',
                    style: GoogleFonts.cairo(fontSize: 14),
                  ),
                ),
                Text(
                  ' ) / ',
                  style: GoogleFonts.cairo(fontSize: 23),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    '365',
                    style: GoogleFonts.cairo(fontSize: 18),
                  ),
                ),
                Text(
                  '  =  ',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Results',
                    style: GoogleFonts.cairo(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
