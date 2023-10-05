import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/search.dart';
import 'package:store/widgets/suggestion.dart';
import 'package:store/widgets/workspaces.dart';

class FullWorkspace extends StatefulWidget {
  const FullWorkspace({Key? key}) : super(key: key);

  @override
  State<FullWorkspace> createState() => _FullWorkspaceState();
}

class _FullWorkspaceState extends State<FullWorkspace> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Material(
            child: Stack(
      children: [
        Container(
          width: width,
          height: heigth,
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Text(
                'Developer Workspace',
                style: GoogleFonts.sen(
                  color: const Color(0xFF040B14),
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const MySearchBar(),
            mySpacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SUGGESTED ITEMS',
                  style: GoogleFonts.sen(
                    color: const Color(0xFF898A7A),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                  width: 85,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF7EBE7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Suggestion(),
                          ));
                    },
                    child: Text(
                      'Suggest +',
                      style: GoogleFonts.sen(
                        color: colorScheme.secondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 14),
            Expanded(
                child: GridView.count(
              childAspectRatio: 160 / 190,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: const [
                HistoryItem('USB hub', 'assets/images/usb_hub.png', false),
                HistoryItem('Laptop', 'assets/images/laptop.png', false),
                HistoryItem('Keyboard', 'assets/images/keyboard.png', false),
                HistoryItem('USB hub', 'assets/images/usb_hub.png', false),
                HistoryItem('Laptop', 'assets/images/laptop.png', false),
                HistoryItem('Keyboard', 'assets/images/keyboard.png', false),
                HistoryItem('USB hub', 'assets/images/usb_hub.png', false),
                HistoryItem('Laptop', 'assets/images/laptop.png', false),
                HistoryItem('Keyboard', 'assets/images/keyboard.png', false),
                HistoryItem('USB hub', 'assets/images/usb_hub.png', false),
                HistoryItem('Laptop', 'assets/images/laptop.png', false),
                HistoryItem('Keyboard', 'assets/images/keyboard.png', false),
                HistoryItem('USB hub', 'assets/images/usb_hub.png', false),
                HistoryItem('Laptop', 'assets/images/laptop.png', false),
                HistoryItem('Keyboard', 'assets/images/keyboard.png', false),
              ],
            ))
          ]),
        ),
        const Positioned(
          top: 5,
          left: 15,
          child: MyBackButton(),
        ),
        const CheckoutButton()
      ],
    )));
  }
}
