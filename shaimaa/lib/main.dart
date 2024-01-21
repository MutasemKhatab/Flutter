import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shaimaa/firebase_options.dart';
import 'package:shaimaa/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.notoKufiArabicTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFDA1B7A)),
          useMaterial3: true,
        ),
        home: const Home());
  }
}
