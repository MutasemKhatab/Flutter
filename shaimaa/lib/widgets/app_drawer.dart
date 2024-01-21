import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaimaa/screens/login.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
            ),
            child: const Text(
              'القائمة الرئيسية',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          ListTile(
            trailing: const Icon(
              Icons.account_circle_rounded,
              size: 40,
              color: Color.fromARGB(255, 255, 52, 154),
            ),
            title: const Text(
              'تسجيل دخول',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textDirection: TextDirection.rtl,
            ),
            onTap: () {
              // Handle login navigation
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.info,
              size: 40,
              color: Color.fromARGB(255, 255, 52, 154),
            ),
            title: const Text(
              'عن المركز',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textDirection: TextDirection.rtl,
            ),
            onTap: () {
              Navigator.pop(context);
              Future<String> fetchAbout() async {
                final data = await FirebaseFirestore.instance
                    .collection('contact')
                    .doc('info')
                    .get();
                return data.data()!['about'] as String;
              }

              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: const Text(
                        'عن المركز',
                        textAlign: TextAlign.center,
                      ),
                      content: FutureBuilder(
                        future: fetchAbout(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          return SizedBox(
                            height: 300,
                            child: SingleChildScrollView(
                              child: Text(
                                snapshot.data!,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      )));
            },
          ),
          ExpansionTile(
            trailing: const Icon(
              Icons.connect_without_contact_rounded,
              size: 40,
              color: Color.fromARGB(255, 255, 52, 154),
            ),
            title: const Text(
              'تواصل معنا',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textDirection: TextDirection.rtl,
            ),
            children: [
              ListTile(
                trailing: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.call,
                      size: 30,
                      color: Color.fromARGB(255, 255, 52, 154),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
                title: const Text(
                  'اتصال',
                  textDirection: TextDirection.rtl,
                ),
                onTap: () {
                  // Handle contact page navigation
                  Navigator.pop(context); // Close the drawer
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'الرجاء اختيار رقم',
                        textAlign: TextAlign.center,
                      ),
                      content: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: FutureBuilder(
                          future: _fetchPhoneNumbers(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) => ListTile(
                                title: Text(
                                  'رقم الاداره ${index + 1}: ${snapshot.data![index]}',
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () async {
                                  //lanch phone
                                  await launchUrl(Uri.parse(
                                      'tel:${snapshot.data![index]}'));
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ); // Close the drawer
                },
              ),
              ListTile(
                trailing: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.message,
                      size: 30,
                      color: Color.fromARGB(255, 255, 52, 154),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
                title: const Text(
                  'رسالة نصية',
                  textDirection: TextDirection.rtl,
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'الرجاء اختيار رقم',
                        textAlign: TextAlign.center,
                      ),
                      content: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: FutureBuilder(
                          future: _fetchMessages(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) => ListTile(
                                title: Text(
                                  'رقم الاداره ${index + 1}: ${snapshot.data![index]}',
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () async {
                                  //lanch phone
                                  await launchUrl(Uri(
                                    scheme: 'sms',
                                    path: snapshot.data![index],
                                  ));
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/whatsapp.svg',
                      colorFilter: const ColorFilter.mode(
                        Color.fromARGB(255, 255, 52, 154),
                        BlendMode.srcIn,
                      ),
                      height: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                ),
                title: const Text(
                  'واتساب',
                  textDirection: TextDirection.rtl,
                ),
                onTap: () {
                  // Handle contact page navigation
                  Navigator.pop(context); // Close the drawer
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'الرجاء اختيار رقم',
                        textAlign: TextAlign.center,
                      ),
                      content: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: FutureBuilder(
                          future: _fetchWhatsapp(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) => ListTile(
                                title: Text(
                                  'رقم الاداره ${index + 1}: ${snapshot.data![index]}',
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                    'https://wa.me/${snapshot.data![index]}',
                                  ));
                                  //lanch phone
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ); // Close the drawer
                },
              ),
            ],
          ),
          ListTile(
            trailing: const Icon(
              Icons.handshake,
              size: 40,
              color: Color.fromARGB(255, 255, 52, 154),
            ),
            title: const Text(
              'التبرع لصالح المركز',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textDirection: TextDirection.rtl,
            ),
            onTap: () {
              Navigator.pop(context);

              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                          title: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.sizeOf(context).width,
                        height: 200,
                        child: FutureBuilder(
                            future: _fetchBankAccounts(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) => Text(
                                        'رقم الحساب ${index + 1}: ${snapshot.data![index]}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ));
                            }),
                      )));
            },
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('contact')
                        .doc('info')
                        .get()
                        .then((value) {
                      launchUrl(Uri.parse(value.data()!['youtube'] as String));
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/youtube.svg',
                    width: 50,
                    height: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('contact')
                        .doc('info')
                        .get()
                        .then((value) {
                      launchUrl(
                          Uri.parse(value.data()!['gooleMaps'] as String));
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/google-maps.svg',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  FirebaseFirestore.instance
                      .collection('contact')
                      .doc('info')
                      .get()
                      .then((value) {
                    launchUrl(Uri.parse(value.data()!['google'] as String));
                  });
                },
                child: SvgPicture.asset(
                  'assets/icons/google.svg',
                  width: 50,
                  height: 50,
                ),
              ),
              GestureDetector(
                onTap: () {
                  FirebaseFirestore.instance
                      .collection('contact')
                      .doc('info')
                      .get()
                      .then((value) {
                    launchUrl(Uri.parse(value.data()!['facebook'] as String));
                  });
                },
                child: SvgPicture.asset(
                  'assets/icons/facebook.svg',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<List<String>> _fetchBankAccounts() async {
  final data =
      await FirebaseFirestore.instance.collection('bankAccounts').get();
  return data.docs.map((e) => e.data()['account'] as String).toList();
}

Future<List<String>> _fetchPhoneNumbers() async {
  final data =
      await FirebaseFirestore.instance.collection('numbers').doc('call').get();
  return [data.data()!['call']];
}

Future<List<String>> _fetchMessages() async {
  final data =
      await FirebaseFirestore.instance.collection('numbers').doc('sms').get();
  return [data.data()!['sms']];
}

Future<List<String>> _fetchWhatsapp() async {
  final data = await FirebaseFirestore.instance
      .collection('numbers')
      .doc('whatsapp')
      .get();
  return [data.data()!['whatsapp']];
}
