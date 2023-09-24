import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ElevatedButton(
          child: const Text("ok"),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: -0.30,
                  ),
                ),
                content: const Text(
                  'Are you sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF677294),
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                    letterSpacing: -0.30,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0EBE7F),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ok',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0EBE7F),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
