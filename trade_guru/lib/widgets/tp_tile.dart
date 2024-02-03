import 'package:flutter/material.dart';

class TpTile extends StatelessWidget {
  const TpTile({required this.index, required this.tp, Key? key})
      : super(key: key);
  final int index;
  final String tp;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: ShapeDecoration(
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: ListTile(
        leading: Text(
          "TP${index + 1}",
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        title: Center(
          child: Text(
            tp,
            style: const TextStyle(
              color: Color(0xFF00DF53),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
