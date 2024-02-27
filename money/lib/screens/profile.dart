import 'package:flutter/material.dart';
import 'package:money/helpers/auth.dart';
import 'package:money/main.dart';
import 'package:money/screens/input.dart';
import 'package:money/screens/login.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () async {
              await Auth.signOut();
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isAdmin)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Input(),
                    ),
                  );
                },
                child: const Text('Enter Admin Panel'),
              ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Rate App'),
            ),
          ],
        ),
      ),
    );
  }
}
