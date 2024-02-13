import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:std_tech/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color(0xffFEE502)).copyWith(
          primary: Color(0xffFEE502),
          secondary: Color.fromARGB(255, 4, 12, 111),
        ),
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'Std_Tech',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
