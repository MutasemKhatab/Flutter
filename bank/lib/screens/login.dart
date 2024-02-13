import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/info.dart';
import 'package:bank/screens/reset_pass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? showWhat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: showWhat == null
                      ? null
                      : showWhat == true
                          ? MediaQuery.of(context).size.height
                          : 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.chevron_right_outlined,
                              color: Colors.amber, size: 200),
                          Text(
                            'Login',
                            style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FilledButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Info()));
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              textStyle: const TextStyle(fontSize: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: const Text('Login'),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                      myInputField(
                          hintText: 'Email',
                          icon: Icons.email_outlined,
                          obscureText: false),
                      myInputField(
                          hintText: 'Password',
                          icon: Icons.lock,
                          obscureText: true),
                      Align(
                        alignment: const Alignment(-0.9, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ResetPass()));
                          },
                          child: Text(
                            'forgot password?',
                            style: GoogleFonts.cairo(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: Colors.amber,
                  height: showWhat == null
                      ? null
                      : showWhat == false
                          ? MediaQuery.of(context).size.height
                          : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text('Create an account',
                          style: GoogleFonts.cairo(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Align(
                        alignment: const Alignment(0.9, 0),
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            textStyle: const TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: const Text('Register'),
                        ),
                      ),
                      myInputField(
                          hintText: 'Full Name',
                          icon: Icons.person,
                          obscureText: false),
                      myInputField(
                          hintText: 'Email',
                          icon: Icons.email,
                          obscureText: false),
                      myInputField(
                          hintText: 'Password',
                          icon: Icons.lock,
                          obscureText: true),
                      myInputField(
                          hintText: 'Confirm Password',
                          icon: Icons.lock,
                          obscureText: true),
                      myInputField(
                          hintText: 'Phone Number',
                          icon: Icons.phone,
                          obscureText: false),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: showWhat == null ? 420 : null,
              right: 0,
              bottom: showWhat == null ? null : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showWhat = false;
                      });
                    },
                    child: Container(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.amber,
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showWhat = true;
                      });
                    },
                    child: Container(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
