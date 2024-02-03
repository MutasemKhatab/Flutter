import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_guru/main.dart';
import 'package:trade_guru/screens/calculator.dart';
import 'package:trade_guru/screens/contact.dart';
import 'package:trade_guru/screens/input_screen.dart';
import 'package:trade_guru/screens/login_screen.dart';

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
            title: const Text('Guru Robot',
                style: TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(Icons.calculate, color: Colors.white),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Calculator(),
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
              title: const Text('Add Suggestion',
                  style: TextStyle(
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
          ListTile(
            title: const Text('Contact Us',
                style: TextStyle(
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
                    reverseTransitionDuration:
                        const Duration(milliseconds: 300),
                  ));
            },
          ),
          ListTile(
            title: const Text('Logout',
                style: TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(Icons.logout, color: Colors.white),
            onTap: () async {
              Navigator.pop(context);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', false);
              await FirebaseAuth.instance
                  .signOut()
                  .then((value) => Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const LoginScreen(),
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
                      )));
            },
          ),
        ],
      ),
    );
  }
}
