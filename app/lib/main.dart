import 'package:flutter/material.dart';
import 'package:app/customized.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradiantContainer(
          Colors.black,
          Color.fromRGBO(156, 156, 156, 1),
        ),
      ),
    ),
  );
}
