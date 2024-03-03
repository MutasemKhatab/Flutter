import 'dart:ui';

import 'package:bike/helpers/item_clipper.dart';
import 'package:bike/helpers/item_painter.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ItemClipper(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: CustomPaint(
          painter: ItemPainter(),
          child: Container(
            width: 165,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.favorite_border),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    'https://via.placeholder.com/121x89',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Road Bike',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: -0.30,
                  ),
                ),
                const Text(
                  'PEUGEOT - LR01 ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -0.30,
                  ),
                ),
                Text(
                  '\$ 1,999.99',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: -0.30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
