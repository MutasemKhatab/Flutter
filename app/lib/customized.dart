import 'dart:math';
import 'package:flutter/material.dart';

class GradiantContainer extends StatelessWidget {
  const GradiantContainer(this.firstColor, this.secondColor, {super.key});
  final Color firstColor;
  final Color secondColor;
  @override
  Widget build(
    context,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            firstColor,
            secondColor,
          ],
          begin: const Alignment(-0.5, -0.5),
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  int imageNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-images/dice-$imageNumber.png',
          width: 150,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              int temp = Random().nextInt(6) + 1;
              if (temp == imageNumber) temp = Random().nextInt(6) + 1;
              imageNumber = temp;
            });
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(20),
            foregroundColor: Colors.amber,
            textStyle: const TextStyle(
              fontSize: 30,
            ),
          ),
          child: const Text("Roll The Fucking Dice"),
        )
      ],
    );
  }
}

class MyText extends StatelessWidget {
  const MyText(this.text, this.color, this.textSize, {super.key});
  final String text;
  final Color color;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: textSize,
      ),
    );
  }
}