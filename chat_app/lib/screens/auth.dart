// ignore_for_file: unused_field, use_build_context_synchronously, unused_local_variable

import 'dart:io';

import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthState();
}

class _AuthState extends State<AuthScreen> {
  bool _isLogin = true;
  String _email = '';
  String _username = '';
  String _password = '';
  File? _image;
  bool _isLoading = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) return;
    if (!_isLogin && _image == null) return;

    _formKey.currentState!.save();

    try {
      setState(() {
        _isLoading = true;
      });
      if (_isLogin) {
        final userCredential = await _firebase.signInWithEmailAndPassword(
            email: _email, password: _password);
      } else {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
            email: _email, password: _password);
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userCredential.user!.uid}.png');
        await storageRef.putFile(_image!);
        String imageURL = await storageRef.getDownloadURL();

        final fireMessaging = FirebaseMessaging.instance;
        await fireMessaging.requestPermission();
        final token = await fireMessaging.getToken();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': _username,
          'email': _email,
          'image_url': imageURL,
          'token': token,
        });
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Authentication faild')));
      setState(() {
        _isLoading = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.only(
                  top: 30, bottom: 20, left: 20, right: 20),
              child: Image.asset('assets/images/chat.png'),
            ),
            Card(
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!_isLogin)
                            UserImagePicker((image) {
                              _image = image;
                            }),
                          TextFormField(
                            onTapOutside: (event) => FocusScope.of(context)
                                .requestFocus(FocusNode()),
                            decoration:
                                const InputDecoration(label: Text('Emai')),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter a valid email';
                              } else {
                                RegExp regex = RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                                if (!regex.hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _email = newValue!;
                            },
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                          if (!_isLogin)
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.trim().length < 4) {
                                  return 'please enter a valid username';
                                }
                                return null;
                              },
                              decoration:
                                  const InputDecoration(labelText: 'Username'),
                              onSaved: (newValue) => _username = newValue!,
                              enableSuggestions: false,
                            ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'Password must be 6 characters long';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _password = newValue!;
                            },
                            onTapOutside: (event) => FocusScope.of(context)
                                .requestFocus(FocusNode()),
                            decoration:
                                const InputDecoration(label: Text('Password')),
                            obscureText: true,
                          ),
                          const SizedBox(height: 12),
                          if (_isLoading) const CircularProgressIndicator(),
                          if (!_isLoading)
                            ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer),
                                child: Text(_isLogin ? 'Login' : 'Signup')),
                          if (!_isLoading)
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isLogin = !_isLogin;
                                  });
                                },
                                child: _isLogin
                                    ? const Text('Create account')
                                    : const Text('I already have an account'))
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
