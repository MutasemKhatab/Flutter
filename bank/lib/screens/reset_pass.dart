import 'package:bank/helpers/input_field.dart';
import 'package:bank/screens/change_pass.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/lock.png',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Please select option to send link reset password',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            myInputField(
                hintText: 'Email',
                icon: Icons.email_outlined,
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            myInputField(
                hintText: 'Phone Number',
                icon: Icons.phone,
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePass()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                ),
                child: const Text('Send Link', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
