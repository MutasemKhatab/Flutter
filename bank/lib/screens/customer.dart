import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/profitability.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customer extends StatelessWidget {
  const Customer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Customer Analysis',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profitability()));
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Customer base:',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    myInputField(
                        hintText: 'Full name',
                        icon: Icons.person,
                        obscureText: false),
                    myInputField(
                        hintText: 'The address',
                        icon: Icons.location_on,
                        obscureText: false),
                    myInputField(
                        hintText: 'Phone number or E-mail',
                        icon: Icons.email,
                        obscureText: false),
                    myInputField(
                        hintText: 'The date of purchase',
                        icon: Icons.date_range,
                        obscureText: false),
                    myInputField(
                        hintText: 'Purchases',
                        icon: Icons.shopping_bag,
                        obscureText: false),
                    myInputField(
                        hintText:
                            'The purpose of negative value is a decrease in market prices an',
                        icon: Icons.polyline_outlined,
                        obscureText: false),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    Text(
                      'Classification of investment preferences',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    myInputField(
                        hintText: 'Write your investment goals',
                        icon: Icons.pageview_outlined,
                        obscureText: false),
                    myInputField(
                        hintText: 'Tolerant risk',
                        icon: Icons.arrow_drop_down,
                        obscureText: false),
                  ])),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    Text(
                      'Determine the high value :',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    myInputField(
                        hintText: 'Total expenses',
                        icon: Icons.attach_money,
                        obscureText: false),
                    myInputField(
                        hintText: 'Investment duration',
                        icon: Icons.timelapse_sharp,
                        obscureText: false),
                  ])),
            ],
          )),
    );
  }
}
