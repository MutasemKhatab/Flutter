import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/item.dart';
import 'package:store/widgets/log_in.dart';
import 'package:store/widgets/search.dart';
import 'package:store/widgets/workspaces.dart';

class Shop extends StatefulWidget {
  const Shop(this.changeScreen, {Key? key}) : super(key: key);
  final void Function(Widget newWidget) changeScreen;
  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.only(right: 24),
                width: width,
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Text(
                        'Popular now',
                        style: GoogleFonts.sen(
                          color: const Color(0xFF040B14),
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 24, 0, 24),
                        width: width - 48,
                        height: 190,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF0A0A02),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: (width / 2) - 30,
                                child: Text(
                                  'Adjustable Office Chair',
                                  style: GoogleFonts.sen(
                                    color: const Color(0xFFF4F5F7),
                                    fontSize: 21,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hughlan Workspaces',
                                    style: GoogleFonts.sen(
                                      color: const Color(0xFFA6A798),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 3,
                                    height: 3,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFA6A798),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '4.8 ',
                                    style: GoogleFonts.sen(
                                      color: const Color(0xFFDDDDDA),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 12,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        fixedSize: const Size(100, 40),
                                        backgroundColor: colorScheme.primary,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Item(),
                                            ));
                                      },
                                      child: Text(
                                        'View Item',
                                        style: GoogleFonts.sen(
                                          color: const Color(0xFF040B14),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      )),
                                  const SizedBox(width: 12),
                                  Material(
                                    shape: const CircleBorder(),
                                    color:
                                        const Color.fromARGB(255, 76, 76, 68),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      splashColor: colorScheme.primary,
                                      onTap: () {},
                                      child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                          ),
                                          child: const Icon(
                                            Icons.shopping_bag_outlined,
                                            color: Color.fromARGB(
                                                255, 166, 167, 152),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                    Positioned(
                      right: 15,
                      top: -10,
                      child: SizedBox(
                        width: 130,
                        height: 270,
                        child: Image.asset(
                          "assets/images/chair.png",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              GenereHeader('Workspaces', () {
                openWorkSpace(context);
              }),
              const SizedBox(height: 12),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 180,
                  child: Row(
                    children: [
                      Category(
                          "assets/images/photographer.png", "Photographer"),
                      Category("assets/images/developer.png", "Developer"),
                      Category("assets/images/youtuber.png", "Youtuber"),
                      Category("assets/images/marketer.png", "Marketer"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GenereHeader('New arrivals', () {
                //TODO add arrivals Widgets Expandde to text
              }),
              const SizedBox(height: 14),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 24),
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [
                        NewArrival('Smart Apple Watch SE',
                            "assets/images/apple_watch.png"),
                        NewArrival('Mouse', "assets/images/mouse.png"),
                        NewArrival('Keyboard', "assets/images/keyboard.png"),
                        NewArrival('Camera', "assets/images/camera.png"),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          Positioned(
            left: 15,
            top: 5,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                widget.changeScreen(LogIn(true, widget.changeScreen));
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const ShapeDecoration(
                    shape: CircleBorder(), color: Colors.black),
                child: Image.asset(
                  "assets/images/sample-user-image.png",
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 5,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: colorScheme.primary,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Search()));
              },
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFDDDDDA))),
                  ),
                  child: const Icon(Icons.search_sharp)),
            ),
          ),
          const CheckoutButton()
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category(this.image, this.title, {Key? key}) : super(key: key);
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: const Color.fromARGB(255, 242, 243, 245),
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            splashColor: colorScheme.primary,
            onTap: () {},
            child: Container(
              height: 180,
              width: 135,
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        image,
                        height: 110,
                        width: 119,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      title,
                      style: GoogleFonts.sen(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                    Text(
                      '43 suggested item',
                      style: GoogleFonts.sen(
                        color: const Color(0xFFA6A798),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        const SizedBox(width: 20)
      ],
    );
  }
}

class NewArrival extends StatelessWidget {
  const NewArrival(this.title, this.image, {Key? key}) : super(key: key);
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            splashColor: colorScheme.primary,
            child: Container(
              height: 110,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFDDDDDA)),
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 105,
                    height: 86,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF4F5F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Stack(children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            image,
                            width: 60,
                            fit: BoxFit.contain,
                            height: 60,
                          ),
                        ),
                      ),
                      const Positioned(top: 6, right: 6, child: LikeButton()),
                    ]),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.sen(
                          color: const Color(0xFF040B14),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            'Maddy Workspaces',
                            style: GoogleFonts.sen(
                              color: const Color(0xFFA6A798),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFA6A798),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '4.8 ',
                            style: GoogleFonts.sen(
                              color: const Color(0xFF898A7A),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 230, 0),
                            size: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '\$319.00',
                        style: GoogleFonts.sen(
                          color: colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
