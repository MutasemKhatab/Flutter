import 'package:bank/screens/pay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Research extends StatelessWidget {
  const Research({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        const SizedBox(height: 150),
        Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height - 150,
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              )),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Text(
                  'Research and analysis',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Text(
                  'https://www.alraideh.com',
                  style: GoogleFonts.cairo(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        color: Colors.black,
                        width: MediaQuery.sizeOf(context).width - 160,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Text(
                          'Enter the type of investment',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: Colors.black,
                        width: MediaQuery.sizeOf(context).width - 160,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Text(
                          'Client Login Date',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: Colors.black,
                        width: MediaQuery.sizeOf(context).width - 160,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Text(
                          'Client Login Date',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Pay()));
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
