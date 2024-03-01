import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final Widget icon;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (s) {
        _focusNode.unfocus();
      },
      focusNode: _focusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        suffixIcon: AnimatedScale(
          scale: _focusNode.hasFocus ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: widget.icon,
        ),
        labelText: widget.label,
      ),
    );
  }
}
