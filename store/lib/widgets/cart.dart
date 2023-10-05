import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/checkout.dart';
import 'package:store/widgets/welcome.dart';
import 'package:store/widgets/workspaces.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Material(
            child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 15, 24, 24),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: [
                CartItem('Keyboard', 'assets/images/keyboard.png', width),
                CartItem('Camera', 'assets/images/camera.png', width),
                CartItem('Laptop', 'assets/images/laptop.png', width),
                CartItem('Mouse', 'assets/images/mouse.png', width),
                CartItem('Microphone', 'assets/images/microphone.png', width),
              ]),
            )),
            mySpacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.sen(
                    color: const Color(0xFF07120E),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
                Text(
                  '\$248.00',
                  style: GoogleFonts.sen(
                    color: colorScheme.secondary,
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                )
              ],
            ),
            mySpacer,
            MyElevatedButton('Proceed to Checkout', Size(width, 60), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Checkout(),
                  ));
            })
          ]),
        ),
        Positioned(
            top: 0,
            child: Container(
              width: width,
              margin: const EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              child: Text(
                'Your Cart',
                style: GoogleFonts.sen(
                  color: const Color(0xFF040B14),
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            )),
        const Positioned(
          left: 15,
          top: 5,
          child: MyBackButton(),
        )
      ],
    )));
  }
}

class CartItem extends StatefulWidget {
  const CartItem(this.title, this.image, this.width, {Key? key})
      : super(key: key);
  final double width;
  final String title;
  final String image;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: const Color(0xFFF4F5F7),
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            splashColor: colorScheme.primary,
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: widget.width,
              height: 110,
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.image,
                    width: 100,
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: widget.width - 190,
                        child: Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.sen(
                            color: const Color(0xFF040B14),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'USD 87.00',
                        style: GoogleFonts.sen(
                          color: const Color(0xFFBA5C3D),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Material(
                            color: Colors.transparent,
                            shape: const CircleBorder(
                                side: BorderSide(
                                    width: 0.2, color: Color(0xFFD1D1CC))),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                setState(() {
                                  if (counter > 1) {
                                    counter--;
                                  }
                                });
                              },
                              splashColor: colorScheme.primary,
                              child: const Icon(
                                Icons.remove,
                                color: Color(0xFFD1D1CC),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$counter',
                            style: GoogleFonts.sen(
                              color: const Color(0xFFA6A798),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Material(
                            color: Colors.transparent,
                            shape: const CircleBorder(
                                side: BorderSide(
                                    width: 0.2, color: Color(0xFFD1D1CC))),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              splashColor: colorScheme.primary,
                              child: const Icon(
                                Icons.add,
                                color: Color(0xFFD1D1CC),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Material(
                            color: const Color(0xFFFEFEFD),
                            borderRadius: BorderRadius.circular(11),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(11),
                              splashColor: colorScheme.primary,
                              onTap: () {},
                              child: Container(
                                width: 55,
                                height: 22,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Remove',
                                  style: GoogleFonts.sen(
                                    color: const Color(0xFF040B14),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
