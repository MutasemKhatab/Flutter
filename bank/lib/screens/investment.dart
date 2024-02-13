import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/record.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Investment extends StatelessWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  'Investment Management',
                  style: GoogleFonts.cairo(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              myInputField(
                  hintText: 'Amount Value',
                  icon: Icons.attach_money,
                  obscureText: false),
              myInputField(
                  hintText: 'Duration',
                  icon: Icons.timelapse_outlined,
                  obscureText: false),
              myInputField(
                  hintText: 'Intrest Rate',
                  icon: Icons.percent,
                  obscureText: false),
              myInputField(
                  hintText: 'Receivables history',
                  icon: Icons.history,
                  obscureText: false),
              myInputField(
                  hintText: 'Guarantees',
                  icon: Icons.edit_document,
                  obscureText: false),
            ],
          ),
          Positioned(
            bottom: 50,
            right: 50,
            child: FilledButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Record()));
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child:
                  Text('Save', style: GoogleFonts.cairo(color: Colors.white)),
            ),
          ),
          Positioned(
              bottom: -5,
              child: Image.asset(
                'assets/inves_pic.png',
                width: 170,
                height: 170,
              ))
        ],
      ),
    );
  }
}
