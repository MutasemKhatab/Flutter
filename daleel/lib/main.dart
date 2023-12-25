import 'package:daleel/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daleel',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 124, 245)),
          bodyMedium: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 0, 124, 245)),
          bodySmall: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 15,
              color: Color.fromARGB(255, 0, 124, 245)),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 124, 245)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
