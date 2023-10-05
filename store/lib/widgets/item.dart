import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/welcome.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

List itemPreviewList = [
  const ItemPreview(0, false, null, 'assets/images/chair.png'),
  const ItemPreview(1, false, null, 'assets/images/chair2.png'),
  const ItemPreview(2, false, null, 'assets/images/chair3.png'),
];
void itemPreviewIndecator(int index) {}

int publicIndex = 0;

class _ItemState extends State<Item> {
  int _index = 0;
  final CarouselController _controller = CarouselController();
  void update() {
    setState(() {
      _index = publicIndex;
      _controller.animateToPage(_index);
    });
  }

  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    for (var i = 0; i < itemPreviewList.length; i++) {
      if (i == _index) {
        var temp =
            ItemPreview(i, true, update, itemPreviewList.elementAt(i).image);
        itemPreviewList.removeAt(i);
        itemPreviewList.insert(i, temp);
      } else {
        var temp =
            ItemPreview(i, false, update, itemPreviewList.elementAt(i).image);
        itemPreviewList.removeAt(i);
        itemPreviewList.insert(i, temp);
      }
    }
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: width,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 0, left: 24, right: 24, bottom: 24),
                        color: const Color(0xFFF4F5F7),
                        width: width,
                        height: 420,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 65),
                              Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 340,
                                        child: CarouselSlider(
                                            items: [
                                              Image.asset(
                                                  "assets/images/chair.png"),
                                              Image.asset(
                                                  "assets/images/chair2.png"),
                                              Image.asset(
                                                  "assets/images/chair3.png")
                                            ],
                                            carouselController: _controller,
                                            options: CarouselOptions(
                                              autoPlayAnimationDuration:
                                                  const Duration(seconds: 1),
                                              aspectRatio: 1.6,
                                              autoPlay: true,
                                              enlargeCenterPage: true,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _index = index;
                                                });
                                              },
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [...itemPreviewList],
                              ),
                            ]),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 2 * width / 3,
                                  child: Text(
                                    'Hughlan Ergonomic Adjustable Office Chair',
                                    style: GoogleFonts.sen(
                                      color: const Color(0xFF040B14),
                                      fontSize: 21,
                                      fontWeight: FontWeight.w900,
                                      height: 0,
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
                                        color: Colors.black,
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
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              width: 79,
                              height: 78,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              decoration:
                                  const BoxDecoration(color: Color(0xFFF5FAF8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '\$113',
                                    style: GoogleFonts.sen(
                                      color: const Color(0xFF1B3D2F),
                                      fontSize: 21,
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '7% off',
                                    style: GoogleFonts.sen(
                                      color: const Color(0xFF1B3D2F),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        height: 100,
                        width: width,
                        child: Text(
                          'Hughlan ergonomic chair adopts an ergonomic design.This ergonomic desk chair can help you ease fatigue, reduce occupational disesase and let you develop good sitting posture habits',
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.sen(
                            color: const Color(0xFF040B14),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'WORKSPACES ITEM CAN BE USED',
                          style: GoogleFonts.sen(
                            color: const Color(0xFF040B14),
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.only(left: 24),
                        child: const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CategoryCollapsed(
                                    "Developer", "assets/images/developer.png"),
                                CategoryCollapsed(
                                    "Marketer", "assets/images/marketer.png"),
                                CategoryCollapsed("Photographer",
                                    "assets/images/photographer.png"),
                              ],
                            )),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'RELATED ITEM',
                          style: GoogleFonts.sen(
                            color: const Color(0xFF040B14),
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.only(left: 24),
                        height: 200,
                        child: const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              RelatedItem(
                                "Markus Office Chair",
                                "assets/images/chair.png",
                              ),
                              RelatedItem(
                                "Markus Office Chair",
                                "assets/images/chair2.png",
                              ),
                              RelatedItem(
                                "Markus Office Chair",
                                "assets/images/chair3.png",
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyElevatedButton(
                                'Add to cart', const Size(270, 60), () {}),
                            Material(
                              shape: const CircleBorder(),
                              color: Colors.white,
                              child: IconButton(
                                  splashRadius: 25,
                                  iconSize: 40,
                                  splashColor: colorScheme.primary,
                                  onPressed: () {
                                    setState(() {
                                      isFav = !isFav;
                                    });
                                  },
                                  icon: Icon(isFav
                                      ? Icons.favorite
                                      : Icons.favorite_outline)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      )
                    ]),
              ),
            ),
            Positioned(
              top: -4,
              left: 15,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  splashRadius: 20,
                  splashColor: colorScheme.primary,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left_outlined,
                    size: 34,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              child: Container(
                width: 40,
                height: 40,
                decoration: const ShapeDecoration(
                    shape: CircleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFDDDDDA))),
                    color: Colors.white),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      splashRadius: 20,
                      splashColor: colorScheme.primary,
                      onPressed: () {
                        //TODO Share button
                      },
                      icon: const Icon(
                        Icons.share_rounded,
                        size: 22,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemPreview extends StatelessWidget {
  const ItemPreview(this.index, this.isCurrent, this.update, this.image,
      {Key? key})
      : super(key: key);
  final String image;
  final int index;
  final bool isCurrent;
  final void Function()? update;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        publicIndex = index;
        update!();
      },
      child: Container(
        width: 65,
        height: 65,
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.all(4),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 0.6,
                color: isCurrent ? colorScheme.secondary : Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorScheme.primary.withOpacity(0.25),
          ),
          child: Image.asset(image),
        ),
      ),
    );
  }
}

class RelatedItem extends StatelessWidget {
  const RelatedItem(this.title, this.image, {Key? key}) : super(key: key);
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            splashColor: colorScheme.primary,
            child: Container(
              height: 200,
              width: 165,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: const Color(0xFFDDDDDA))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFF4F5F7)),
                      width: double.infinity,
                      height: 85,
                      child: Stack(children: [
                        Center(child: Image.asset(image)),
                        const Positioned(right: 10, top: 0, child: LikeButton())
                      ]),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sen(
                        color: const Color(0xFF040B14),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Hughlan Workspaces',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.sen(
                              color: const Color(0xFFA6A798),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
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
                    const SizedBox(height: 12),
                    Text(
                      '\$319.00',
                      style: GoogleFonts.sen(
                        color: const Color(0xFFBA5C3D),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        )
      ],
    );
  }
}

class CategoryCollapsed extends StatelessWidget {
  const CategoryCollapsed(this.title, this.image, {Key? key}) : super(key: key);
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: const Color(0xFFF4F5F7),
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            splashColor: colorScheme.primary,
            child: Container(
              width: 220,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 65,
                    height: 65,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              ]),
            ),
          ),
        ),
        const SizedBox(width: 20)
      ],
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 32,
        height: 32,
        decoration: ShapeDecoration(
          color: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Icon(
          isTapped ? Icons.favorite : Icons.favorite_outline,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
