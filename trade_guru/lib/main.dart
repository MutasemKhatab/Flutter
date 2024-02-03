import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_guru/firebase_options.dart';
import 'package:trade_guru/helpers/theme.dart';
import 'package:trade_guru/screens/home.dart';
import 'package:trade_guru/screens/login_screen.dart';

bool isAdmin = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<Widget> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    isAdmin = doc.data()!['isAdmin'];

    if (isLoggedIn == true) {
      return const Home();
    } else {
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FutureBuilder(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(body: LoginScreen());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!;
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
