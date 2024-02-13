import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/client_info2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159, // 2 * pi for a full rotation
    ).animate(_controller);

    _controller.repeat(); // Rotate indefinitely
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  RotationTransition(
                      turns: _rotationAnimation,
                      child: Transform.rotate(
                        angle: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.antiAlias,
                          child: Transform.rotate(
                              angle: -150,
                              child: Transform.scale(
                                scale: 1.5,
                                child: Image.asset(
                                  'assets/record_pic1.png',
                                ),
                              )),
                        ),
                      )),
                  const SizedBox(
                    height: 35,
                  ),
                  Transform.rotate(
                    angle: 150,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      clipBehavior: Clip.antiAlias,
                      child: Transform.rotate(
                          angle: -150,
                          child: Text(
                            'Calculate\nAccrued\nInterest',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  RotationTransition(
                    turns: _rotationAnimation,
                    child: Transform.rotate(
                      angle: 150,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        child: Transform.rotate(
                            angle: -150,
                            child: Transform.scale(
                              scale: 1.5,
                              child: Image.asset(
                                'assets/record_pic2.png',
                              ),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Transform.rotate(
                    angle: 150,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ClientInfo2(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        child: Transform.rotate(
                            angle: -150,
                            child: Text(
                              'Track\nOutstanding\nBalance',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  RotationTransition(
                    turns: _rotationAnimation,
                    child: Transform.rotate(
                      angle: 150,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        child: Transform.rotate(
                            angle: -150,
                            child: Transform.scale(
                              scale: 1.5,
                              child: Image.asset(
                                'assets/record_pic3.png',
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Container(
                width: 250,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myInputField(
                        hintText: 'Record incoming payments',
                        icon: Icons.bookmark_border_rounded,
                        obscureText: false),
                    const TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                    ),
                    const TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
