import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/widgets/orders.dart';
import 'package:store/widgets/welcome.dart';
import 'package:store/widgets/workspaces.dart';

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Material(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 15),
        Text(
          'All Done!',
          style: GoogleFonts.sen(
            color: const Color(0xFF040B14),
            fontSize: 21,
            fontWeight: FontWeight.w900,
          ),
        ),
        Expanded(
            child: Center(
          child: SvgPicture.asset('assets/images/box.svg'),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: MyElevatedButton('Go to Orders', Size(width, 60), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Orders(),
                ));
          }),
        ),
        mySpacer
      ]),
    ));
  }
}
