import 'package:flutter/material.dart';
import 'package:money/helpers/auth.dart';
import 'package:money/main.dart';
import 'package:money/screens/base.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset('assets/images/logo.png', height: 200, width: 200),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () async {
                    await Auth.signInAnonymously(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Base(),
                      ),
                    );
                  },
                  child: const Text('Skip'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                  ),
                ],
              ),
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if (!isLogin)
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      fixedSize: Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () async {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the fields'),
                          ),
                        );
                        return;
                      }
                      if (isLogin) {
                        if (emailController.text == 'admin' &&
                            passwordController.text == '@#M3^&*D48SC') {
                          isAdmin = true;
                        } else {
                          await Auth.signIn(emailController.text,
                              passwordController.text, context);
                        }
                      } else {
                        await Auth.signUp(emailController.text,
                            passwordController.text, context);
                        isLogin = true;
                        return;
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Base(),
                        ),
                      );
                    },
                    child: Text(isLogin ? 'Login' : 'Register'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(isLogin ? 'Create an account' : 'Login'),
                  ),
                ],
              ),
            ),
            FilledButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () async {
                  await Auth.signInWithGoogle(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Base(),
                    ),
                  );
                },
                icon: Icon(Icons.g_mobiledata_rounded),
                label: Text('Login with Google')),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
