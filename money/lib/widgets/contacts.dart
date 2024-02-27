import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key, required this.title, this.image, this.onTap})
      : super(key: key);
  final String title;
  final String? image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        leading: image != null ? Image.asset(image!) : null,
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('join now >',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
