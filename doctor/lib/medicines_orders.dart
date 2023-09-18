import 'dart:ui';
import 'package:flutter/material.dart';

class MedicinesOrders extends StatelessWidget {
  const MedicinesOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            left: -72,
            top: -32,
            child: Container(
              width: 216,
              height: 216,
              decoration: const ShapeDecoration(
                color: Color.fromARGB(90, 96, 205, 255),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            right: -48,
            bottom: -33,
            child: Container(
              width: 216,
              height: 216,
              decoration: const ShapeDecoration(
                color: Color(0x4C0EBE7E),
                shape: OvalBorder(),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.fromLTRB(20, 36, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: ShapeDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Icon(
                        Icons.chevron_left_sharp,
                        color: Color.fromARGB(255, 103, 114, 148),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Medicines orders',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 34, 0, 24),
                  width: MediaQuery.of(context).size.width,
                  height: 54,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x11000000),
                        blurRadius: 40,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          cursorHeight: 15,
                          cursorColor: Color(0xFF0EBE7E),
                          style: TextStyle(
                            backgroundColor: Colors.white,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: Color(0xFF677294),
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        splashRadius: 1,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 20,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 75,
                              height: 75,
                              decoration: const BoxDecoration(
                                  color: Color(0xC1C6EFE5),
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.shopping_basket,
                                color: Color(0xFF0EBE7F),
                                size: 35,
                              ),
                            ),
                            Container(
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Text(
                                'Guide to medicine order',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 14,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
