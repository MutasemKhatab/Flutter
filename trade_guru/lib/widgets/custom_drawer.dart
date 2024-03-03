import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_guru/helpers/lang.dart';
import 'package:trade_guru/main.dart';
import 'package:trade_guru/screens/affiliate_program.dart';
import 'package:trade_guru/screens/guru_robot.dart';
import 'package:trade_guru/screens/contact.dart';
import 'package:trade_guru/screens/input_screen.dart';
import 'package:trade_guru/screens/login_screen.dart';
import 'package:trade_guru/screens/lot_size.dart';
import 'package:trade_guru/screens/notes.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: const Center(
              child: Text(
                'Trade Guru',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(Lang.guroRobot,
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(Icons.calculate, color: Colors.white),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const GuruRobot(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, -1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      final tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 300),
                  ));
            },
          ),
          if (isAdmin)
            ListTile(
              title: Text(Lang.addSuggestion,
                  style: const TextStyle(
                    color: Colors.white,
                  )),
              leading: const Icon(Icons.add, color: Colors.white),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const InputScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, -1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        final tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 300),
                    ));
              },
            ),
          if (isAdmin)
            ListTile(
              title: Text(Lang.notes,
                  style: const TextStyle(
                    color: Colors.white,
                  )),
              leading: const Icon(Icons.notes, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Notes(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, -1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        final tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 300),
                    ));
              },
            ),
          ListTile(
            title: Text(Lang.lotSize,
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading:
                const Icon(Icons.card_giftcard_outlined, color: Colors.white),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LotSize(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, -1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      final tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 300),
                  ));
            },
          ),
          ListTile(
            title: Text(Lang.affiliateMarketingProgram,
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(Icons.school, color: Colors.white),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AffiliateProgram(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      final tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 300),
                  ));
            },
          ),
          ListTile(
            title: Text(Lang.contactUs,
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(Icons.contact_page, color: Colors.white),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const ContactScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(-1.0, -1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    final tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 300),
                  reverseTransitionDuration: const Duration(milliseconds: 300),
                ),
              );
            },
          ),
          ListTile(
              title: Text(Lang.help,
                  style: const TextStyle(
                    color: Colors.white,
                  )),
              leading: const Icon(Icons.help, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                launchUrl(Uri.parse(
                    'https://youtu.be/N39_yXF7Vvo?si=CXK9A0nmu6gCur2L'));
              }),
          ListTile(
            title: Text(Lang.logOut,
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(Icons.logout, color: Colors.white),
            onTap: () async {
              Navigator.pop(context);
              _logout(context);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', false);
              await FirebaseAuth.instance.signOut().then((value) async {
                await FirebaseMessaging.instance
                    .unsubscribeFromTopic('notification');
              });
            },
          ),
          ListTile(
            title: Text(Lang.isEn ? 'العربية' : 'English',
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(Icons.language, color: Colors.white),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (Lang.isEn) {
                Lang.isEn = false;
                await prefs.setBool('isEn', false);
              } else {
                Lang.isEn = true;
                await prefs.setBool('isEn', true);
              }
              if (context.mounted) {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MyApp(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, -1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        final tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 300),
                    ));
              }
            },
          ),
        ],
      ),
    );
  }

  Future _logout(BuildContext context) {
    return Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, -1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
        ));
  }
}
