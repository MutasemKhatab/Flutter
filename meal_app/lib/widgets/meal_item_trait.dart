import 'package:flutter/material.dart';

class MealITemTrait extends StatelessWidget {
  const MealITemTrait(this.label, this.icon, {Key? key}) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        )
      ],
    );
  }
}
