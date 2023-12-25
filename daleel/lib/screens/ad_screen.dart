import 'package:daleel/models/ad.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdScreen extends StatelessWidget {
  const AdScreen({required this.ad, Key? key}) : super(key: key);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    final images = [
      'phone',
      'whatsapp',
      'instagram',
      'twitter',
      'snap',
      'safari'
    ];
    if (ad.instgram == '') images.remove('instagram');
    if (ad.twitter == '') images.remove('twitter');
    if (ad.snapchat == '') images.remove('snap');
    if (ad.phone == '') images.remove('phone');
    if (ad.whatsapp == '') images.remove('whatsapp');
    if (ad.url == '') images.remove('safari');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: Image.network(
            ad.image,
            fit: BoxFit.fill,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...images
                  .map((e) => GestureDetector(
                      onTap: () {
                        if (e == 'phone') {
                          launchUrl(Uri.parse('tel:${ad.phone}'));
                        } else if (e == 'safari') {
                          launchUrl(Uri.parse('https://${ad.url}'));
                        } else if (e == 'instagram') {
                          launchUrl(Uri.parse(
                              'https://www.instagram.com/${ad.instgram}'));
                        } else if (e == 'snap') {
                          launchUrl(Uri.parse(
                              'https://www.snapchat.com/add/${ad.snapchat}'));
                        } else if (e == 'twitter') {
                          launchUrl(
                              Uri.parse('https://twitter.com/${ad.twitter}'));
                        } else if (e == 'whatsapp') {
                          launchUrl(Uri.parse(
                              'https://api.whatsapp.com/send?phone=966${ad.whatsapp}'));
                        }
                      },
                      child: Image.asset(
                        'assets/icons/$e.png',
                        width: 50,
                        height: 50,
                      )))
                  .toList()
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
