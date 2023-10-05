import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/widgets/done.dart';
import 'package:store/widgets/welcome.dart';
import 'package:store/widgets/workspaces.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Material(
            child: Stack(children: [
      Container(
        padding: const EdgeInsets.fromLTRB(24, 65, 24, 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PAYMENT',
                style: GoogleFonts.sen(
                  color: const Color(0xFFA6A798),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              PaymentMethod(true, width),
              PaymentMethod(false, width),
              const SizedBox(height: 20),
              Text(
                'SHIPPING INFORMATION',
                style: GoogleFonts.sen(
                  color: const Color(0xFF898A7A),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 366,
                height: 134,
                decoration: ShapeDecoration(
                  color: const Color(0xFFEFEFEC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Image.asset('assets/images/map.png'),
              ),
              const SizedBox(height: 10),
              Text(
                'Address',
                style: GoogleFonts.sen(
                  color: const Color(0xFFC1C2B8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '6391 Elgin St. Celina, Delaware 10299',
                style: GoogleFonts.sen(
                  color: const Color(0xFF040B14),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Phone number',
                style: GoogleFonts.sen(
                  color: const Color(0xFFC1C2B8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '(480) 555-0103',
                style: GoogleFonts.sen(
                  color: const Color(0xFF040B14),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: 1,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF4F5F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              mySpacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: GoogleFonts.sen(
                      color: const Color(0xFFA6A798),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$248.00',
                    style: GoogleFonts.sen(
                      color: const Color(0xFF898A7A),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping cost',
                    style: GoogleFonts.sen(
                      color: const Color(0xFFA6A798),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$50.00',
                    style: GoogleFonts.sen(
                      color: const Color(0xFF898A7A),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.sen(
                      color: const Color(0xFF07120E),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '\$298.00',
                    style: GoogleFonts.sen(
                      color: const Color(0xFFBA5C3D),
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              MyElevatedButton('Checkout', Size(width, 60), () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Done(),
                    ));
              })
            ]),
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
              'Checkout',
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
    ])));
  }
}

class PaymentMethod extends StatefulWidget {
  const PaymentMethod(this.isSelected, this.width, {Key? key})
      : super(key: key);
  final double width;
  final bool isSelected;
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool? isSelected;
  @override
  Widget build(BuildContext context) {
    isSelected = isSelected ?? widget.isSelected;
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            setState(() {
              isSelected = !(isSelected!);
            });
          },
          child: Container(
            padding: const EdgeInsets.all(18),
            width: widget.width,
            height: 50,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 0.60,
                    color: isSelected! ? const Color(0xFF8ADD4B) : Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/visa.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 15),
                Text(
                  'Abbyn Bank',
                  style: GoogleFonts.sen(
                    color: const Color(0xFF040B14),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  '****  8910',
                  style: GoogleFonts.sen(
                    color: const Color(0xFFA6A798),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 14,
                  height: 14,
                  decoration: ShapeDecoration(
                    color: isSelected! ? const Color(0xFF8ADD4B) : Colors.white,
                    shape: CircleBorder(
                        side: BorderSide(
                            width: 0.5,
                            color: isSelected! ? Colors.white : Colors.grey)),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
