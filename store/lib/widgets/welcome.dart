import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/log_in.dart';
import 'package:store/widgets/shop.dart';

class Welcome extends StatelessWidget {
  const Welcome(this.changeScreen, {Key? key}) : super(key: key);
  final void Function(Widget newWidget) changeScreen;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          child: SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              "assets/images/start_up_image.png",
              fit: BoxFit.cover,
              alignment: const Alignment(0.0, 0),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 20, bottom: 20),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME TO',
                  style: GoogleFonts.sen(
                    color: colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Remotely.io',
                  style: GoogleFonts.sen(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.84,
                  ),
                ),
                Text(
                  'We serve you with the best gadgets for your home workspace',
                  style: GoogleFonts.sen(
                    color: const Color(0xFFDDDDDA),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 25),
                MyElevatedButton('Browse Shop', const Size(350, 60), () {
                  changeScreen(Shop(changeScreen));
                }),
                const SizedBox(height: 5),
                Center(
                  child: TextButton(
                      onPressed: () {
                        changeScreen(LogIn(true, changeScreen));
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.primary,
                        fixedSize: const Size(70, 22),
                      ),
                      child: Text(
                        'Log In',
                        style: GoogleFonts.sen(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton(this.text, this.size, this.onPressed, {Key? key})
      : super(key: key);
  final String text;
  final Size size;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: size, backgroundColor: colorScheme.primary),
      child: Text(
        text,
        style: GoogleFonts.sen(
          color: const Color(0xFF040B14),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
