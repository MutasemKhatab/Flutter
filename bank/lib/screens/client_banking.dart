import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientBanking extends StatelessWidget {
  const ClientBanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
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
                Column(
                  children: [
                    FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text('Save',
                          style: GoogleFonts.cairo(color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    FilledButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ClientInfo()));
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text('Close',
                          style: GoogleFonts.cairo(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
            myInputField(
                hintText: 'Business Name',
                icon: Icons.work_rounded,
                obscureText: false),
            myInputField(
                hintText: 'Bank Name',
                icon: Icons.account_balance_outlined,
                obscureText: false),
            myInputField(
                hintText: 'Bank Address(address, city, state, country, postal)',
                icon: Icons.location_city,
                obscureText: false),
            myInputField(
                hintText: 'Bank Officer',
                icon: Icons.table_restaurant,
                obscureText: false),
            myInputField(
                hintText: 'E-mail Address',
                icon: Icons.email,
                obscureText: false),
            myInputField(
                hintText: 'Telephone No / Fax No',
                icon: Icons.call,
                obscureText: false),
            myInputField(
                hintText: 'Swift Code Account Number ',
                icon: Icons.code,
                obscureText: false),
            myInputField(
                hintText: 'Account Name',
                icon: Icons.account_circle_rounded,
                obscureText: false),
            myInputField(
                hintText: 'Beneficiary Name',
                icon: Icons.person,
                obscureText: false),
          ],
        ),
      ),
    );
  }
}
