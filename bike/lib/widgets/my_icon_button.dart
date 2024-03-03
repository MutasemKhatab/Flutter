import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton(
      {Key? key,
      required this.onTap,
      required this.child,
      required this.firstColor,
      required this.secondColor,
      this.begin,
      this.end})
      : super(key: key);
  final void Function() onTap;
  final Widget child;
  final Color firstColor, secondColor;
  final Alignment? begin, end;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: begin ?? const Alignment(0.46, -0.89),
            end: end ?? const Alignment(-0.46, 0.89),
            colors: [
              firstColor,
              secondColor,
            ],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5,
              color: Colors.white.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: child,
      ),
    );
  }
}
