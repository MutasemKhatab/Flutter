import 'package:bank/screens/risk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Withdrawal extends StatefulWidget {
  const Withdrawal({Key? key}) : super(key: key);

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
              bottom: -50,
              child: Image.asset(
                'assets/withdrawal.png',
                width: MediaQuery.sizeOf(context).width - 100,
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Risk(),
                      )),
                  child: Text(
                    'Write down the laws and regulations that govern financial activities in your country',
                    style: GoogleFonts.cairo(fontSize: 23, color: Colors.amber),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white)),
                      itemCount: 10),
                ),
                const SizedBox(height: 20),
                Text(
                  'Penalties for early withdrawal',
                  style: GoogleFonts.cairo(fontSize: 23, color: Colors.amber),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white)),
                      itemCount: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
