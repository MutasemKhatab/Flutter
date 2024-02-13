import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/automated.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profitability extends StatelessWidget {
  const Profitability({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            Text(
              'Profitability Reports',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Track the overall performance of the business',
              style: GoogleFonts.cairo(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            myInputField(
                hintText:
                    'Sales( The amount of money raised from selling products)',
                icon: Icons.attach_money_sharp,
                obscureText: false),
            myInputField(
                hintText: 'Cost ( Money spent )',
                icon: Icons.money,
                obscureText: false),
            myInputField(
                hintText:
                    'Profits ( The money remaining after deducting costs from sales)',
                icon: Icons.panorama_fish_eye_outlined,
                obscureText: false),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Calculate net income',
                style: GoogleFonts.cairo(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
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
                    'Net Income',
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
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    'Sale',
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
                    'Coast',
                    style: GoogleFonts.cairo(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
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
                    'Expenses',
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
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ROI analysis for different loan types',
                style: GoogleFonts.cairo(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: Row(
                children: [
                  Image.asset(
                    'assets/profit.png',
                    width: 157,
                  ),
                  Column(children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(
                            'ROI',
                            style: GoogleFonts.cairo(fontSize: 17),
                          ),
                        ),
                        Text(
                          '  = (  ',
                          style: GoogleFonts.cairo(
                              fontSize: 23, color: Colors.white),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(
                            'Sales Price',
                            style: GoogleFonts.cairo(fontSize: 16),
                          ),
                        ),
                        Text(
                          ' - ',
                          style: GoogleFonts.cairo(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
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
                            'Purchase price',
                            style: GoogleFonts.cairo(fontSize: 16),
                          ),
                        ),
                        Text(
                          '  ) /  ',
                          style: GoogleFonts.cairo(
                              fontSize: 18, color: Colors.white),
                        ),
                      ],
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
                            'Purchase price',
                            style: GoogleFonts.cairo(fontSize: 16),
                          ),
                        ),
                        Text(
                          '  =  ',
                          style: GoogleFonts.cairo(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(
                            'Result',
                            style: GoogleFonts.cairo(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Automated(),
                            ));
                      },
                      child: Text(
                        'Export to Excel',
                        style: GoogleFonts.cairo(
                            color: Colors.green, fontSize: 22),
                      ),
                    )
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
