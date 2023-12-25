import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) => setState(() {
                _currentIndex = value;
              }),
          iconSize: 30,
          unselectedItemColor: const Color.fromARGB(255, 152, 179, 198),
          selectedItemColor: const Color.fromARGB(255, 37, 150, 190),
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.notifications,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.message,
              ),
            ),
          ]),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 150, 190),
      ),
    );
  }
}
