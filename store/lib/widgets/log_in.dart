import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/shop.dart';
import 'package:store/widgets/welcome.dart';

class LogIn extends StatefulWidget {
  const LogIn(this.login, this.changeScreen, {Key? key}) : super(key: key);
  final bool login;
  final Function(Widget newWidget) changeScreen;
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool? login;
  @override
  Widget build(BuildContext context) {
    login == null ? login = widget.login : login = login;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(25, login! ? 110 : 40, 20, 25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            login!
                ? Text(
                    'Welcome Back',
                    style: GoogleFonts.sen(
                      color: const Color(0xFF040B14),
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  )
                : Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome to ',
                          style: GoogleFonts.sen(
                            color: const Color(0xFF040B14),
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Remotly.io',
                          style: GoogleFonts.sen(
                            color: colorScheme.primary,
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 20),
            LogInWith(login! ? "Login with Google" : " Sign Up with Google",
                Image.asset("assets/icons/google_icon.png")),
            const SizedBox(height: 20),
            LogInWith(login! ? "Login with Facebook" : " Sign Up with Facebook",
                Image.asset("assets/icons/facebook_icon.png")),
            const SizedBox(height: 25),
            Center(
              child: Text(
                'OR',
                style: GoogleFonts.sen(
                  color: const Color(0xFFC1C2B8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Email',
              style: GoogleFonts.sen(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 8),
            const TextInput("Eg. jamesburnes@gmail.com", false),
            const SizedBox(height: 25),
            login!
                ? const SizedBox()
                : SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone number',
                          style: GoogleFonts.sen(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            SizedBox(
                              height: 55,
                              width: 65,
                              child: TextInput("+123", false),
                            ),
                            SizedBox(width: 10),
                            Expanded(child: TextInput("", false))
                          ],
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 25),
            Text(
              'Password',
              style: GoogleFonts.sen(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 8),
            const TextInput("", true),
            const SizedBox(height: 40),
            MyElevatedButton(login! ? "Login" : "Sign Up", const Size(350, 60),
                () {
              widget.changeScreen(Shop(widget.changeScreen));
            }),
            const SizedBox(height: 75),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: colorScheme.primary),
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.sen(
                      color: const Color(0xFF898A7A),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      login = !login!;
                    });
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: colorScheme.primary),
                  child: Text(
                    login! ? 'Sign Up' : "Login",
                    style: GoogleFonts.sen(
                      color: colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  const TextInput(this.hint, this.password, {Key? key}) : super(key: key);
  final String hint;
  final bool password;
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  obscureText: show,
                  enableSuggestions: !show,
                  autocorrect: !show,
                  onTapOutside: (event) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  style: GoogleFonts.sen(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration.collapsed(
                      hintStyle: GoogleFonts.sen(
                        color: const Color(0xFFA6A798),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                      hintText: widget.hint)),
            ),
            widget.password
                ? IconButton(
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      setState(() {
                        show = show ? false : true;
                      });
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class LogInWith extends StatelessWidget {
  const LogInWith(this.by, this.icon, {Key? key}) : super(key: key);
  final String by;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: colorScheme.primary,
        onTap: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Error. Try again later"),
            duration: const Duration(seconds: 1),
            action: SnackBarAction(
                label: "ok",
                onPressed: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                }),
          ));
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(32, 19, 32, 19),
          height: 60,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.50, color: Color(0xFFC1C2B8)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            icon,
            Expanded(
              child: Center(
                child: Text(
                  by,
                  style: GoogleFonts.sen(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
