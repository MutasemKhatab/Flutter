import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/client_banking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientInfo extends StatelessWidget {
  const ClientInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(height: 50),
          Row(
            children: [
              Text(
                'CLIENT BUISNESS\nINFORMATION',
                style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClientBanking()));
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child:
                    Text('Next', style: GoogleFonts.cairo(color: Colors.white)),
              ),
            ],
          ),
          myInputField(
              hintText: 'Buisness Name',
              icon: Icons.work_outlined,
              obscureText: false),
          myInputField(
              hintText: 'Buisness Address',
              icon: Icons.location_on_outlined,
              obscureText: false),
          myInputField(
              hintText: 'Buisness Email',
              icon: Icons.email,
              obscureText: false),
          myInputField(
              hintText: 'Buisness Telephone',
              icon: Icons.call,
              obscureText: false),
          myInputField(
              hintText: 'Country / State of Registration',
              icon: Icons.location_city,
              obscureText: false),
          myInputField(
              hintText: 'Registration Number / EIN / TIN / CO GOVT ID',
              icon: Icons.numbers,
              obscureText: false),
          myInputField(
              hintText: 'Company incorporation State / Province',
              icon: Icons.business_sharp,
              obscureText: false),
          myInputField(
              hintText: 'Owners / Directors of Company',
              icon: Icons.person,
              obscureText: false),
          myInputField(
              hintText: 'Year Founded',
              icon: Icons.date_range,
              obscureText: false),
        ]),
      ),
    );
  }
}
