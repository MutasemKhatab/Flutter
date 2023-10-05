import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/main.dart';
import 'package:store/widgets/search.dart';
import 'package:store/widgets/workspaces.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Material(
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(24, 65, 24, 24),
            child: Column(
              children: [
                const MySearchBar(),
                const SizedBox(height: 24),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(children: [
                  OrdersItem(width),
                  OrdersItem(width),
                  OrdersItem(width),
                  OrdersItem(width),
                ]))),
              ],
            ),
          ),
          const Positioned(
            left: 15,
            top: 5,
            child: MyBackButton(),
          ),
          Positioned(
              top: 0,
              child: Container(
                width: width,
                margin: const EdgeInsets.only(
                  top: 15,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Your Orders',
                  style: GoogleFonts.sen(
                    color: const Color(0xFF040B14),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )),
          const Positioned(child: CheckoutButton()),
        ]),
      ),
    );
  }
}

class OrdersItem extends StatelessWidget {
  const OrdersItem(this.width, {Key? key}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 180,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: ShapeDecoration(
        color: const Color(0xFFF4F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      padding: const EdgeInsets.all(12),
      child: Stack(children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/airpods.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: width / 2,
                      child: Text(
                        'Delivered September 30',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.sen(
                          color: const Color(0xFF040B14),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      width: width / 2,
                      child: Text(
                        'Apple Airpods Pro 2nd Gen  with Wireless Charging',
                        overflow: TextOverflow.fade,
                        style: GoogleFonts.sen(
                          color: const Color(0xFF040B14),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    fixedSize: Size(width, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    side: const BorderSide(width: 0.40, color: Color(0xFF040B14)),
                    foregroundColor: colorScheme.primary),
                onPressed: () {},
                child: Text(
                  'View Item',
                  style: GoogleFonts.sen(
                    color: const Color(0xFF040B14),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ))
          ],
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Text(
            '#09567',
            style: GoogleFonts.sen(
              color: const Color(0xFFBA5C3D),
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        )
      ]),
    );
  }
}
