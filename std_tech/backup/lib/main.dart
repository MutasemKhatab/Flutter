import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal, // Set the primary color
        scaffoldBackgroundColor: Colors.grey[200], // Set the background color
        fontFamily: 'YourCustomFont', // Replace with your custom font
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal, // Set the app bar color
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent, // Set the button color
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.teal, // Set text color
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: Colors.black87, // Set text color
          ),
        ),
      ),
      home: const Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
