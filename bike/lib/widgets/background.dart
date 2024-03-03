import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      right: -300,
      child: Container(
        transform: Matrix4.rotationZ(0.5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.16, -0.99),
            end: Alignment(-0.16, 0.99),
            colors: [
              Color(0xFF37B6E9),
              Color(0xFF4B4CED),
            ],
          ),
        ),
      ),
    );
  }
}
