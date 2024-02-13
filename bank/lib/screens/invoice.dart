import 'package:bank/screens/intrest.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Invoice extends StatelessWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Stack(
          children: [
            const Positioned(
                child: SizedBox(
              height: double.infinity,
            )),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 2 * MediaQuery.sizeOf(context).height / 3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9999),
                  bottomRight: Radius.circular(9999),
                ),
                color: Colors.black,
              ),
            ),
            Positioned(
                top: 50,
                left: 20,
                child: Container(
                  width: MediaQuery.sizeOf(context).width / 1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Invoice Number',
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.amber, filled: true),
                      ),
                      Text('Payment due date',
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.amber, filled: true),
                      ),
                      Text('Deserved amount',
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.amber, filled: true),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Client Details',
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Name',
                              style: GoogleFonts.cairo(
                                  color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              'Address',
                              style: GoogleFonts.cairo(
                                  color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              'Phone Number',
                              style: GoogleFonts.cairo(
                                  color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              'Email',
                              style: GoogleFonts.cairo(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('Client Details',
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Intrest(),
                              ));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
