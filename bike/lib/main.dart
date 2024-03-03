import 'package:bike/helpers/theme.dart';
import 'package:bike/screens/home.dart';
import 'package:flutter/material.dart';

//TODO refactor ur ass code and download the assets

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}
