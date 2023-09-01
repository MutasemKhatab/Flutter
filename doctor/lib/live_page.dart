import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  State<LivePage> createState() => _MainState();
}

class _MainState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 189, 27, 27)
                .withOpacity(0.07999999821186066),
          ),
          child:
              Image.asset("assets/images/live_doctor.jpeg", fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 36, 20, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment(Alignment.center.x, Alignment.center.y - 0.1),
            ),
            //color: Colors.black.withOpacity(0.07999999821186066),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Icon(
                      Icons.chevron_left_sharp,
                      color: Color.fromARGB(78, 114, 148, 1),
                    ),
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Image.asset(
                      "assets/images/live_doctor1.png",
                      height: 36,
                      width: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 25),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: Image.asset(
                        "assets/images/comment_picture.png",
                        height: 36,
                        width: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Everhart Tween',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Text(
                        'Thanks for shareing doctor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.30,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 25),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: Image.asset(
                        "assets/images/comment_picture.png",
                        height: 36,
                        width: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Everhart Tween',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Text(
                        'Thanks for shareing doctor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.30,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 25),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: Image.asset(
                        "assets/images/comment_picture.png",
                        height: 36,
                        width: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Everhart Tween',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Text(
                        'Thanks for shareing doctor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.30,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 25),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: Image.asset(
                        "assets/images/comment_picture.png",
                        height: 36,
                        width: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Everhart Tween',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Text(
                        'Thanks for shareing doctor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.30,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                width: 335,
                height: 54,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 180,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      width: 44,
                      height: 44,
                      decoration: const ShapeDecoration(
                          color: Color(0xFF0EBE7E),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                      child: const Icon(
                        Icons.comment_sharp,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Add a Comment..."),
                      ),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                        ))
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
