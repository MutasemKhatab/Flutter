import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField(
      {required this.label,
      required this.controller,
      required this.keyboardType,
      this.icon,
      super.key});
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData? icon;
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Set the animation duration
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Theme.of(context).colorScheme.secondary),
        top: BorderSide(
          color: isFocused
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
        ),
        left: BorderSide(
          color: isFocused
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
        ),
        right: BorderSide(
          color: isFocused
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
        ),
      )),
      child: TextField(
        obscureText: widget.keyboardType == TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        onTap: () {
          setState(() {
            isFocused = true;
          });
        },
        keyboardType: widget.keyboardType,
        onTapOutside: (e) {
          FocusScope.of(context).unfocus();
          setState(() {
            isFocused = false;
          });
        },
        controller: widget.controller,
        decoration: InputDecoration(
            prefixIcon: widget.icon == null
                ? null
                : Icon(
                    widget.icon,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            hintText: widget.label,
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
            border: InputBorder.none),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
        cursorColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
