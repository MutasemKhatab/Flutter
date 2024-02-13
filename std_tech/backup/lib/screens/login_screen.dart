import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text('الاسم'),
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              controller: numberController,
              decoration: const InputDecoration(
                label: Text('رقم الهاتف'),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          const SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              controller: locationController,
              decoration: const InputDecoration(
                label: Text(
                  'المنطقة',
                ),
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              controller: gradeController,
              decoration: const InputDecoration(
                label: Text('المرحله الدراسية'),
                prefixIcon: Icon(Icons.grade),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Perform login or data submission logic here
              String name = nameController.text;
              String number = numberController.text;
              String location = locationController.text;
              String grade = gradeController.text;

              // You can handle the submitted data as needed
              print(
                  'Name: $name, Number: $number, Location: $location, Grade: $grade');
            },
            child: const Text(
              'تسجيل',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
