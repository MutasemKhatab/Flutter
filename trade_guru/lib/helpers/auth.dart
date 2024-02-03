import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_guru/main.dart';
import 'package:trade_guru/screens/home.dart';

class Auth {
  Auth(this.context);

  final BuildContext context;
  UserCredential? userCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signIn(String email, String password) async {
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final ref = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential!.user!.uid)
          .get();
      isAdmin = ref.data()!['isAdmin'];
      push();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      return true;
    } on FirebaseAuthException catch (e) {
      catchError(e.code);
      return false;
    }
  }

  Future<bool> signUp(String email, String password, String name) async {
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential!.user!.uid)
          .set({
        'name': name,
        'email': email,
        'isAdmin': false,
      });
      return true;
    } on FirebaseAuthException catch (e) {
      catchError(e.code);
      return false;
    }
  }

  void push() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => const Home()));
  }

  void catchError(String eCode) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(eCode.toError),
      backgroundColor: Colors.red,
    ));
  }
}

extension StringExtension on String {
  String get toError {
    final List<String> words = split('-');
    for (var i = 0; i < words.length; i++) {
      words[i] = ' ${words[i][0].toUpperCase()}${words[i].substring(1)}';
    }
    return words.join();
  }
}
