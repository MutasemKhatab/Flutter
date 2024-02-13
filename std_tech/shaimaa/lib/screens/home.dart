import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaimaa/widgets/ad_panel.dart';
import 'package:shaimaa/widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawer: const AppDrawer(),
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/app-bar-logo.png'))),
              child: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('contact')
                          .doc('info')
                          .get()
                          .then((value) {
                        launchUrl(Uri.parse(value.data()!['share']));
                      });
                    },
                  ),
                  backgroundColor: Colors.transparent),
            )),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back2.jpg'),
                  fit: BoxFit.cover)),
          padding: const EdgeInsets.all(10),
          child: const Column(
            children: [
              SizedBox(height: 50),
              Text(
                'أهلاً بكم في مركز\nالشيماء بنت الحارث\nلتحفيظ القرآن الكريم',
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 50),
              Text(
                'إعلانات المركز',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: double.infinity,
              ),
              AdPanel()
            ],
          ),
        ),
      ),
    );
  }
}
