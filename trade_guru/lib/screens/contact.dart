import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
        backgroundColor: const Color(0xFF131723),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF0A0A0A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                fixedSize: const Size(200, 50),
                side: const BorderSide(color: Color.fromARGB(255, 255, 0, 247)),
              ),
              icon: SvgPicture.asset(
                'assets/icons/instagram.svg',
                width: 50,
                height: 50,
                colorFilter: const ColorFilter.mode(
                    Colors.transparent, BlendMode.srcOver),
              ),
              onPressed: () {
                launchUrl(Uri.parse('https://www.instagram.com/tradeguru.io'));
              },
              label: const Text('Instagram',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                fixedSize: const Size(200, 50),
                side: const BorderSide(color: Color(0xFF0088CC)),
              ),
              icon: SvgPicture.asset(
                'assets/icons/telegram.svg',
                width: 50,
                height: 50,
                colorFilter:
                    const ColorFilter.mode(Color(0xFF0088CC), BlendMode.srcIn),
              ),
              onPressed: () {
                launchUrl(Uri.parse('https://t.me/TradeGuruEAForex'));
              },
              label: const Text('Telegram',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
