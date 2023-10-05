import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/welcome.dart';
import 'package:store/widgets/workspaces.dart';

class Suggestion extends StatefulWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  RangeValues values = const RangeValues(10, 2000);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Material(
        child: SizedBox(
          width: width,
          height: heigth,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: width,
                    height: 420,
                    decoration: const BoxDecoration(color: Color(0xFFF4F5F7)),
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/images/light.png',
                      height: 350,
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Blush & Brass Desk Lamp',
                          style: GoogleFonts.sen(
                            color: const Color(0xFF040B14),
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Good for Developer',
                              style: GoogleFonts.sen(
                                color: const Color(0xFF4BB347),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xFF4BB347),
                              size: 20,
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Description',
                              style: GoogleFonts.sen(
                                color: const Color(0xFF898A7A),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              splashColor: colorScheme.primary,
                              child: Text(
                                'Change',
                                style: GoogleFonts.sen(
                                  color: colorScheme.secondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  height: 0,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'This LED desk lamp is a great addition to any workspace and ver essential for developers, thanks to its compact size and numerous lighting settings.',
                          style: GoogleFonts.sen(
                            color: const Color(0xFF040B14),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Add price range',
                          style: GoogleFonts.sen(
                            color: const Color(0xFF898A7A),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 6,
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 20),
                            ),
                            child: RangeSlider(
                              activeColor: colorScheme.secondary,
                              inactiveColor: const Color(0xFFF4F5F7),
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
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$10',
                              style: GoogleFonts.sen(
                                color: const Color(0xFF07120E),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '\$${values.start.toInt()}    \$${values.end.toInt()}',
                              style: GoogleFonts.sen(
                                color: colorScheme.secondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                        mySpacer,
                        MyElevatedButton('Suggest item', Size(width, 60), () {})
                      ],
                    ),
                  ))
                ],
              ),
              Positioned(
                  top: 0,
                  child: Container(
                    width: width,
                    margin: const EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    child: Text(
                      'Scanned Item Info',
                      style: GoogleFonts.sen(
                        color: const Color(0xFF040B14),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  )),
              const Positioned(left: 15, top: 5, child: MyBackButton())
            ],
          ),
        ),
      ),
    );
  }
}
