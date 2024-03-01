import 'package:flutter/material.dart';
import 'package:jobs/screens/home.dart';
import 'package:jobs/themes/main_theme.dart';

// ! TODO refactor new design widget
// ! TODO refactor new design widget
// ! TODO refactor new design widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job',
      theme: theme,
      darkTheme: darkTheme,
      home: const Home(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
