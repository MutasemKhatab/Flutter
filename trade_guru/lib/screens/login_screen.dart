import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:trade_guru/helpers/auth.dart';
import 'package:trade_guru/helpers/lang.dart';
import 'package:trade_guru/widgets/my_text_field.dart';

import '../helpers/app_notfications.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isFocused = false;
  bool isLogin = true;
  bool isProcessing = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xff00DF53).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xff00DF53).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  child: const Text(
                    'Trade Guru',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  isLogin ? Lang.login : Lang.signUp,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                const SizedBox(height: 100),
                Visibility(
                  visible: !isLogin,
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  child: AnimatedContainer(
                    duration: const Duration(
                        milliseconds: 300), // Set the animation duration
                    width: double.infinity,
                    height: isLogin ? 0 : 50,
                    child: MyTextField(
                        label: Lang.name,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        icon: Icons.person),
                  ),
                ),
                if (!isLogin) const SizedBox(height: 20),
                MyTextField(
                    label: Lang.email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email),
                const SizedBox(height: 20),
                MyTextField(
                    label: Lang.password,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    icon: Icons.lock),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isProcessing
                        ? () {}
                        : () async {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                (!isLogin && nameController.text.isEmpty)) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(Lang.fillAllFields),
                                ),
                              );
                              return;
                            }
                            setState(() {
                              isProcessing = true;
                            });
                            if (isLogin) {
                              await Auth(context).signIn(emailController.text,
                                  passwordController.text);
                            } else {
                              if (await Auth(context).signUp(
                                  emailController.text,
                                  passwordController.text,
                                  nameController.text)) {
                                AppNotifications().showLocalNotification(
                                  const RemoteMessage(
                                    notification: RemoteNotification(
                                      title: 'Welcome',
                                      body: 'Please verify your email address',
                                    ),
                                  ),
                                );
                                setState(() {
                                  isLogin = true;
                                });
                              }
                            }
                            setState(() {
                              isProcessing = false;
                            });
                          },
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      padding: const EdgeInsets.all(10),
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                    ),
                    child: isProcessing
                        ? const CircularProgressIndicator()
                        : Text(isLogin ? Lang.login : Lang.signUp),
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  child: Text(
                    isLogin ? Lang.signUp : Lang.login,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
