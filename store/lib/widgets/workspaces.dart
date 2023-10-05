import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/cart.dart';
import 'package:store/widgets/full_workspace.dart';
import 'package:store/widgets/search.dart';
import 'package:store/widgets/shop.dart';

const mySpacer = SizedBox(height: 24);

class Workspaces extends StatefulWidget {
  const Workspaces({Key? key}) : super(key: key);

  @override
  State<Workspaces> createState() => _WorkspacesState();
}

class _WorkspacesState extends State<Workspaces> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Material(
      child: Container(
        width: width,
        height: heigth,
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
              width: width,
              height: heigth,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width,
                      height: 12,
                    ),
                    Text(
                      'Explores Workspace',
                      style: GoogleFonts.sen(
                        color: const Color(0xFF040B14),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: MySearchBar()),
                    mySpacer,
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.only(left: 22),
                      width: width,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.black),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            top: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(32),
                                  bottomRight: Radius.circular(32)),
                              child: Image.asset(
                                "assets/images/sterio.png",
                                width: width / 2,
                                height: 180,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          Positioned(
                              child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent
                                  ],
                                )),
                            width: width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 23),
                                SizedBox(
                                  height: 16,
                                  child: Text(
                                    'FEATURED WORKSPACE',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.sen(
                                      color: const Color(0xFFC1C2B8),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                SizedBox(
                                  height: 50,
                                  child: Text(
                                    'Professional Gaming Accrssories',
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.sen(
                                      color: const Color(0xFFF4F5F7),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const FullWorkspace(),
                                            ));
                                      },
                                      style: TextButton.styleFrom(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.zero,
                                          fixedSize: const Size(67, 1),
                                          foregroundColor:
                                              colorScheme.secondary),
                                      child: Text(
                                        'View space',
                                        style: GoogleFonts.sen(
                                            color: colorScheme.primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            decoration:
                                                TextDecoration.underline),
                                      )),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    mySpacer,
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: GenereHeader('Browse workspaces', () {}),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: width,
                      height: 36,
                      padding: const EdgeInsets.only(left: 24),
                      child: const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MiniGenere('Show all', true),
                              MiniGenere('developer', false),
                              MiniGenere('Filmmaking', false),
                            ]),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(
                          children: [
                            Text.rich(TextSpan(
                              children: [
                                TextSpan(
                                    text: 'What ',
                                    style: GoogleFonts.sen(
                                      color: const Color(0xFF040B14),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    )),
                                TextSpan(
                                    text: 'YouTubers',
                                    style: GoogleFonts.sen(
                                      color: colorScheme.secondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    )),
                                TextSpan(
                                    text: ' search for',
                                    style: GoogleFonts.sen(
                                      color: const Color(0xFF040B14),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    )),
                              ],
                            )),
                            const Spacer(),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                splashColor:
                                    colorScheme.primary.withOpacity(0.5),
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'See more',
                                      style: GoogleFonts.sen(
                                        color: const Color(0xFF898A7A),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.chevron_right_sharp,
                                      color: Color(0xFF898A7A),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                          ],
                        )),
                    const SizedBox(height: 12),
                    Container(
                        width: width,
                        padding: const EdgeInsets.only(left: 24),
                        child: const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              HistoryItem(
                                  'USB hub', 'assets/images/usb_hub.png', true),
                              HistoryItem(
                                  'Laptop', 'assets/images/laptop.png', true),
                              HistoryItem('Keyboard',
                                  'assets/images/keyboard.png', true),
                            ],
                          ),
                        )),
                    const SizedBox(height: 32),
                    Container(
                      width: width,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.60, color: Color(0xFFDDDDDA)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PEOPLE SEARCH FOR',
                            style: GoogleFonts.sen(
                              color: const Color(0xFF040B14),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MiniCategory('Developer',
                                      'assets/images/developer.png'),
                                  MiniCategory('Photographer',
                                      'assets/images/photographer.png'),
                                  MiniCategory(
                                      'Youtuber', 'assets/images/youtuber.png'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        'Based on your bowsing history',
                        style: GoogleFonts.sen(
                          color: const Color(0xFF040B14),
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      height: 250,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.60, color: Color(0xFFDDDDDA)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            NewArrival('Smart Apple Watch SE',
                                "assets/images/apple_watch.png"),
                            NewArrival('Mouse', "assets/images/mouse.png"),
                            NewArrival(
                                'Keyboard', "assets/images/keyboard.png"),
                            NewArrival('Camera', "assets/images/camera.png"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 5,
              left: 15,
              child: MyBackButton(),
            ),
            const CheckoutButton()
          ],
        ),
      ),
    ));
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 24,
        bottom: 24,
        child: Material(
          shape: const CircleBorder(
              side: BorderSide(width: 0, color: Colors.black)),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            splashColor: colorScheme.primary,
            radius: 1,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ));
            },
            child: Container(
                width: 60,
                height: 60,
                decoration: const ShapeDecoration(
                  color: Colors.black,
                  shape: CircleBorder(
                      side: BorderSide(width: 0, color: Colors.black)),
                ),
                child: const Icon(
                  Icons.shopping_cart_checkout_sharp,
                  color: Colors.white,
                  size: 35,
                )),
          ),
        ));
  }
}

class MiniCategory extends StatelessWidget {
  const MiniCategory(this.title, this.image, {Key? key}) : super(key: key);
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        splashColor: colorScheme.primary,
        child: Container(
          height: 80,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: GoogleFonts.sen(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '21 suggested items',
                    style: GoogleFonts.sen(
                      color: const Color(0xFFA6A798),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MiniGenere extends StatefulWidget {
  const MiniGenere(this.title, this.isSelected, {Key? key}) : super(key: key);
  final bool isSelected;
  final String title;

  @override
  State<MiniGenere> createState() => _MiniGenereState();
}

class _MiniGenereState extends State<MiniGenere> {
  bool isSelected = false;
  bool firstTime = true;
  @override
  Widget build(BuildContext context) {
    if (firstTime) isSelected = widget.isSelected;

    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          firstTime = false;
        });
      },
      child: Container(
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(
              color: isSelected ? Colors.black : const Color(0xFFF4F5F7),
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            widget.title,
            style: GoogleFonts.sen(
              color: isSelected ? const Color(0xFFF4F5F7) : Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )),
    );
  }
}

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(
          side: BorderSide(width: 1, color: Color(0xFFDDDDDA))),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: colorScheme.primary,
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            width: 40,
            height: 40,
            decoration: const ShapeDecoration(
              shape: CircleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFDDDDDA))),
            ),
            child: const Icon(Icons.arrow_back_ios_sharp)),
      ),
    );
  }
}

class GenereHeader extends StatelessWidget {
  const GenereHeader(this.title, this.todo, {Key? key}) : super(key: key);
  final String title;
  final void Function() todo;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.sen(
            color: const Color(0xFF040B14),
            fontSize: 21,
            fontWeight: FontWeight.w900,
            height: 0,
          ),
        ),
        const Spacer(),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: colorScheme.primary.withOpacity(0.5),
            onTap: () {
              todo();
            },
            child: Row(
              children: [
                Text(
                  'See more',
                  style: GoogleFonts.sen(
                    color: const Color(0xFF898A7A),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.chevron_right_sharp,
                  color: Color(0xFF898A7A),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}

void openWorkSpace(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Workspaces(),
      ));
}
