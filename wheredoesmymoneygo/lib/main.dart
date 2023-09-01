// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wheredoesmymoneygo/widget/expenses.dart';

var colorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 13, 114, 84)).copyWith(
        primary: Color.fromARGB(255, 13, 114, 84),
        secondary: Color.fromARGB(255, 245, 168, 191),
        background: Color.fromARGB(255, 252, 228, 235));
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: colorScheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: colorScheme.onPrimaryContainer,
              foregroundColor: colorScheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
              color: colorScheme.background,
              shadowColor: colorScheme.onSecondary),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primaryContainer))),
      home: const Expenses(),
    ),
  );
}
