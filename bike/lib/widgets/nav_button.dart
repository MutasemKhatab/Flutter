import 'package:bike/helpers/nav_button_painter.dart';
import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  const NavButton({Key? key}) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton>
    with SingleTickerProviderStateMixin {
  bool tapped = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapped = !tapped;
        });
        if (tapped) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: SizedBox(
          width: 50,
          height: 50,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.01),
                  end: const Offset(0, 0.0),
                ).animate(_controller),
                child: AnimatedPhysicalModel(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  animateShadowColor: true,
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  elevation: tapped ? 10.0 : 0.0,
                  color: Colors.transparent,
                  shadowColor: Colors.black,
                  child: FadeTransition(
                    opacity: CurvedAnimation(
                        parent: _controller,
                        curve: Curves.fastLinearToSlowEaseIn),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CustomPaint(
                        painter: NavButtonPainter(),
                      ),
                    ),
                  ),
                ),
              ),
              const Icon(Icons.home),
            ],
          )),
    );
  }
}
