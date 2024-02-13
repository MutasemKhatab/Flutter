import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/reinvestment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pay extends StatelessWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/card.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Card Number',
              style: GoogleFonts.cairo(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 20),
            myInputField(
                hintText: '**** **** **** ****',
                icon: Icons.credit_card,
                obscureText: false),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valid until',
                      style:
                          GoogleFonts.cairo(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      width: 200,
                      child: myInputField(
                          hintText: 'month/year',
                          icon: Icons.date_range,
                          obscureText: false),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CVV',
                      style:
                          GoogleFonts.cairo(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      width: 200,
                      child: myInputField(
                          hintText: '***',
                          icon: Icons.numbers,
                          obscureText: false),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Card Holder',
              style: GoogleFonts.cairo(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              width: 200,
              child: myInputField(
                  hintText: 'Name', icon: Icons.person, obscureText: false),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              value: false,
              onChanged: (value) {},
              activeColor: Colors.blue,
              title: Text(
                'Save card data for future payments',
                style: GoogleFonts.cairo(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Reinvestment()));
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(500),
                  ),
                ),
                child: const Text('Proceed to confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
