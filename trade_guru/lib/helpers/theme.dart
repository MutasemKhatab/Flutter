import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color(0xFF1B2028)).copyWith(
    primary: const Color(0xFF1B2028),
    secondary: const Color(0xFF3A6FF8),
  ),
  fontFamily: 'jura',
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    backgroundColor: const Color(0xFF1B2028),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(const Color(0xFF3A6FF8)),
  ),
);
