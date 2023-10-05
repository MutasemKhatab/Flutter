import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/item.dart';
import 'package:store/widgets/shop.dart';
import 'package:store/widgets/welcome.dart';
import 'package:store/widgets/workspaces.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Material(
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Stack(children: [
          Positioned(
            top: -4,
            left: 19,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Search',
                    style: GoogleFonts.sen(
                      color: const Color(0xFF040B14),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: MySearchBar(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'RECENT',
                  style: GoogleFonts.sen(
                    color: const Color(0xFFA6A798),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  mainAxisSpacing: 15,
                  crossAxisCount: 1,
                  childAspectRatio: 16,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width - 100,
                            child: Text(
                              'Phone tripod stand',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.sen(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.close,
                            color: Colors.grey,
                          )
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width - 100,
                            child: Text(
                              'Phone tripod stand',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.sen(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.close,
                            color: Colors.grey,
                          )
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width - 100,
                            child: Text(
                              'Phone tripod stand',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.sen(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.close,
                            color: Colors.grey,
                          )
                        ]),
                  ],
                ),
              ),
              const SizedBox(height: 44),
              Container(
                width: width,
                height: 1,
                decoration: const BoxDecoration(color: Color(0xFFF4F5F7)),
                margin: const EdgeInsets.symmetric(horizontal: 50),
              ),
              const SizedBox(height: 44),
              Container(
                padding: const EdgeInsets.only(left: 24),
                child: GenereHeader('Your browsing history', () {}),
              ),
              const SizedBox(height: 12),
              Container(
                height: 190,
                width: width,
                padding: const EdgeInsets.only(left: 24),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HistoryItem('USB hub', 'assets/images/usb_hub.png', true),
                      HistoryItem('Laptop', 'assets/images/laptop.png', true),
                      HistoryItem(
                          'Keyboard', 'assets/images/keyboard.png', true),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'What people are searching for',
                  style: GoogleFonts.sen(
                    color: const Color(0xFF040B14),
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
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
              ))
            ],
          ),
        ]),
      ),
    ));
  }
}

class MySearchBar extends StatefulWidget {
  const MySearchBar({Key? key}) : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(24, 0, 5, 0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.60, color: Color(0xFFC8CEDA)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onTapOutside: (event) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              style: GoogleFonts.sen(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration.collapsed(
                  hintText: "Search product name"),
            ),
          ),
          Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: SizedBox(
              height: 40,
              width: 40,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  RangeValues values = const RangeValues(10, 2000);
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    useSafeArea: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    )),
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) =>
                            DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.8,
                          maxChildSize: 0.95,
                          minChildSize: 0.4,
                          builder: (context, scrollController) =>
                              SingleChildScrollView(
                            controller: scrollController,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Filter by',
                                          style: GoogleFonts.sen(
                                            color: const Color(0xFF040B14),
                                            fontSize: 21,
                                            fontWeight: FontWeight.w900,
                                            height: 0,
                                          ),
                                        ),
                                        const Spacer(),
                                        Material(
                                          child: InkWell(
                                            splashColor: colorScheme.primary,
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              alignment: Alignment.center,
                                              child: const Icon(
                                                Icons.close,
                                                size: 20,
                                                color: Color(0xFF898A7A),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Price  ${values.start.toInt()}\$  -  ${values.end.toInt()}\$',
                                      style: GoogleFonts.sen(
                                        color: const Color(0xFF898A7A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    SizedBox(
                                      height: 20,
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          trackHeight: 6,
                                          overlayShape:
                                              const RoundSliderOverlayShape(
                                                  overlayRadius: 20),
                                        ),
                                        child: RangeSlider(
                                          activeColor: colorScheme.secondary,
                                          inactiveColor:
                                              const Color(0xFFF4F5F7),
                                          max: 2000,
                                          min: 10,
                                          values: values,
                                          onChanged: (value) {
                                            setState(() {
                                              values = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Row(
                                      children: [
                                        Text(
                                          '\$10',
                                          style: GoogleFonts.sen(
                                            color: const Color(0xFF07120E),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '\$2k',
                                          style: GoogleFonts.sen(
                                            color: const Color(0xFF07120E),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Product type',
                                      style: GoogleFonts.sen(
                                        color: const Color(0xFF898A7A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const FilterRow('Laptops', false),
                                    const FilterRow('Tabels', false),
                                    const FilterRow('Chairs', false),
                                    const FilterRow('Keyboards', false),
                                    const FilterRow('Laptops', false),
                                    const FilterRow('Earbuds', false),
                                    const FilterRow('Headset', false),
                                    Text(
                                      'Brand',
                                      style: GoogleFonts.sen(
                                        color: const Color(0xFF898A7A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const FilterRow('Apple', false),
                                    const FilterRow('Logitech', false),
                                    const FilterRow('Blue Gallery Home', false),
                                    const FilterRow('Sensibo', false),
                                    const FilterRow('Orca Deco Office', false),
                                    const FilterRow('Dell', false),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                values =
                                                    const RangeValues(10, 2000);
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(150, 40),
                                                backgroundColor:
                                                    const Color(0xFFF4F5F7)),
                                            child: Text(
                                              'Clear filter',
                                              style: GoogleFonts.sen(
                                                color: const Color(0xFF040B14),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            )),
                                        const Spacer(),
                                        MyElevatedButton(
                                            "Apply", const Size(150, 40), () {
                                          Navigator.pop(context);
                                        })
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                splashColor: colorScheme.primary,
                child: const Icon(
                  Icons.filter_alt_outlined,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FilterRow extends StatefulWidget {
  const FilterRow(this.title, this.isSelected, {Key? key}) : super(key: key);
  final String title;
  final bool isSelected;
  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  bool? isSelected;
  @override
  Widget build(BuildContext context) {
    isSelected = isSelected ?? widget.isSelected;
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: GoogleFonts.sen(
                color: const Color(0xFF040B14),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  isSelected = !isSelected!;
                });
              },
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    color: isSelected! ? colorScheme.secondary : Colors.white,
                    border: Border.all(
                        width: isSelected! ? 0 : 0.4,
                        color: const Color(0xFF898A7A))),
                child: isSelected!
                    ? const Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.white,
                      )
                    : const SizedBox(),
              ),
            )
          ],
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem(this.title, this.image, this.useSpace, {Key? key})
      : super(key: key);
  final String title;
  final String image;
  final bool useSpace;
  Widget widget() => Material(
        color: const Color(0xFFF4F5F7),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          splashColor: colorScheme.primary,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            width: 150,
            height: 190,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: 90,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      height: 85,
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.sen(
                                  color: const Color(0xFF040B14),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'GHC 232.00',
                              style: GoogleFonts.sen(
                                color: const Color(0xFFBA5C3D),
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '4.2',
                                  style: GoogleFonts.sen(
                                    color: const Color(0xFF898A7A),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                  size: 20,
                                ),
                              ],
                            )
                          ]),
                    )
                  ],
                ),
                const Positioned(top: 6, right: 6, child: LikeButton()),
              ],
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return useSpace
        ? Row(
            children: [widget(), SizedBox(width: useSpace ? 10 : 0)],
          )
        : widget();
  }
}
