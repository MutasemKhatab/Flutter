import 'package:bank/helpers/input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cost extends StatelessWidget {
  const Cost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'Development Schedule and Cost',
              style: GoogleFonts.cairo(fontSize: 23, color: Colors.white),
            ),
            const SizedBox(height: 20),
            myInputField(
                hintText: 'The chosen job',
                icon: Icons.work,
                obscureText: false),
            myInputField(
                hintText: 'Complexity',
                icon: Icons.compare_arrows_sharp,
                obscureText: false),
            myInputField(
                hintText: 'Preferred development methodology',
                icon: Icons.developer_board_rounded,
                obscureText: false),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/cost.png',
                width: MediaQuery.sizeOf(context).width - 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
