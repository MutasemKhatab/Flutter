import 'package:flutter/material.dart';

class BTCBox extends StatelessWidget {
  const BTCBox({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.0,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      width: (MediaQuery.sizeOf(context).width / 2) - 30,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
