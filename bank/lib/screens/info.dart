import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/client_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Set up your information',
              style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Share your private data to prove your  identity on our platform',
                style: GoogleFonts.cairo(
                  color: Colors.grey,
                  fontSize: 15,
                )),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClientInfo()));
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child:
                    Text('Next', style: GoogleFonts.cairo(color: Colors.white)),
              ),
            ),
            myInputField(
                hintText: 'Full Name',
                icon: Icons.person_outline,
                obscureText: false),
            myInputField(
                hintText: 'Home Address',
                icon: Icons.home_outlined,
                obscureText: false),
            myInputField(
                hintText: 'Email',
                icon: Icons.email_outlined,
                obscureText: false),
            myInputField(
                hintText: 'Home Telephone',
                icon: Icons.phone,
                obscureText: false),
            myInputField(
                hintText: 'Date of Birth / Place of Birth',
                icon: Icons.calendar_today_outlined,
                obscureText: false),
            myInputField(
                hintText: 'Passport Number / Issuing Country',
                icon: Icons.credit_card,
                obscureText: false),
            myInputField(
                hintText: 'Passport Issue Date / Expiry Date',
                icon: Icons.calendar_today_outlined,
                obscureText: false),
            myInputField(
                hintText: 'Nationality / SSN',
                icon: Icons.numbers,
                obscureText: false),
          ],
        ),
      ),
    );
  }
}
