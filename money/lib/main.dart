import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money/firebase_options.dart';
import 'package:money/helpers/theme.dart';
import 'package:money/provider/theme_provider.dart';
import 'package:money/screens/login.dart';
import 'package:provider/provider.dart' as provider;

bool isAdmin = false;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    provider.ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: provider.Consumer<ThemeNotifier>(
        builder: (context, theme, _) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: colorScheme,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              colorScheme: colorSchemeDark,
              brightness: Brightness.dark,
            ),
            themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const Login(),
          );
        },
      ),
    );
  }
}
