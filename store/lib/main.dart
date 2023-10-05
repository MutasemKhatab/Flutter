import 'package:flutter/material.dart';
import 'package:store/widgets/welcome.dart';

//rename widgets
//TODO Edit text overflow
//
var colorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 206, 213, 91))
        .copyWith(
            primary: const Color.fromARGB(255, 206, 213, 91),
            secondary: const Color(0xFFBA5C3D));

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Widget? currentWidget;
  void changeScreen(Widget newWidget) {
    setState(() {
      currentWidget = newWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    currentWidget == null
        ? currentWidget = Welcome(changeScreen)
        : currentWidget = currentWidget;
    return MaterialApp(
      home: Scaffold(body: currentWidget, backgroundColor: Colors.white),
    );
  }
}
