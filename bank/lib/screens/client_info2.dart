import 'package:bank/screens/research.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientInfo2 extends StatelessWidget {
  const ClientInfo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 50,
            child: Container(
              width: 150,
              height: 150,
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset('assets/client_info_pic1.png'),
            ),
          ),
          Positioned(
            top: 150,
            right: 50,
            child: Container(
              width: 150,
              height: 150,
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset('assets/client_info_pic2.png'),
            ),
          ),
          Positioned(
              top: 260,
              left: 30,
              child: Text(
                'Client\nInformation',
                style: GoogleFonts.cairo(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          Positioned(
              top: 350,
              child: Container(
                color: Colors.black,
                width: MediaQuery.sizeOf(context).width - 60,
                height: 50,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Client Login Date',
                  style: TextStyle(color: Colors.grey),
                ),
              )),
          Positioned(
              top: 410,
              child: Container(
                color: Colors.black,
                width: MediaQuery.sizeOf(context).width - 60,
                height: 50,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Client Login Hour',
                  style: TextStyle(color: Colors.grey),
                ),
              )),
          Positioned(
              top: 470,
              child: Container(
                color: Colors.black,
                width: MediaQuery.sizeOf(context).width - 60,
                height: 50,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Investment History',
                  style: TextStyle(color: Colors.grey),
                ),
              )),
          Positioned(
            top: 530,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Research(),
                    ));
              },
              child: Container(
                color: Colors.black,
                width: MediaQuery.sizeOf(context).width - 60,
                height: 50,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Risk assessmnt scores',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
