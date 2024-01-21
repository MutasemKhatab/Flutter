import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shaimaa/models/student.dart';
import 'package:shaimaa/models/teacher.dart';
import 'package:shaimaa/screens/operations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String? selectedOption;
  List<String> options = const [
    'الإدارة',
    'معلمة',
    'طالبة',
    'ولي امر',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              height: MediaQuery.sizeOf(context).height * 0.35,
              fit: BoxFit.cover,
            ),
            Text(
              "مرحباً بك",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 40,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "الرجاء تسجيل الدخول",
              style: TextStyle(
                color: Theme.of(context).primaryColorDark.withAlpha(150),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Theme.of(context).primaryColorDark),
              ),
              width: 150,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButton<String>(
                  hint: Text(
                    'نوع المستخدم',
                    style: GoogleFonts.notoKufiArabic(),
                  ),
                  underline: const SizedBox(),
                  isExpanded: true,
                  value: selectedOption,
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  onChanged: (newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                  },
                  items: options.map((String option) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.centerRight,
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'اسم المستخدم',
                  ),
                  onTapOutside: (event) {},
                  controller: usernameController,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    hintText: 'كلمة المرور',
                  ),
                  onTapOutside: (event) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  fixedSize: const Size(300, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                if (selectedOption == null ||
                    usernameController.text.trim().isEmpty ||
                    passwordController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'الرجاء ملئ الحقول',
                    textAlign: TextAlign.center,
                  )));
                  return;
                }
                //TODO: Admin logIn
                if (selectedOption == 'الإدارة') {
                  if (usernameController.text.trim() != 'admin' ||
                      passwordController.text.trim() != 'admin') {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      'اسم المستخدم او كلمة المرور غير صحيحة',
                      textAlign: TextAlign.center,
                    )));
                    return;
                  }
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Operations(
                          type: selectedOption!,
                        ),
                      ));
                } else if (selectedOption == 'معلمة') {
                  final teachersData =
                      FirebaseFirestore.instance.collection('teachers').get();
                  teachersData.then((value) {
                    final teachers = value.docs
                        .map((e) => Teacher.fromJson(e.data(), e.id))
                        .toList();
                    final teacher = teachers.firstWhere(
                        (element) =>
                            element.name == usernameController.text.trim(),
                        orElse: () => const Teacher());
                    if (teacher.name != usernameController.text.trim() ||
                        '${teacher.name.split(' ')[0]}${teacher.number}' !=
                            passwordController.text.trim()) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'اسم المستخدم او كلمة المرور غير صحيحة',
                        textAlign: TextAlign.center,
                      )));
                      return;
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Operations(
                            type: selectedOption!,
                            teacher: teacher,
                          ),
                        ));
                  });
                } else if (selectedOption == 'طالبة') {
                  final studentsData =
                      FirebaseFirestore.instance.collection('students').get();
                  studentsData.then((value) {
                    final students = value.docs
                        .map((e) => Student.fromJson(e.data(), e.id))
                        .toList();
                    final student = students.firstWhere(
                        (element) =>
                            element.name == usernameController.text.trim(),
                        orElse: () => Student(joinDate: DateTime.now()));
                    if (student.name != usernameController.text.trim() ||
                        '${student.name.split(' ')[0]}${student.number}' !=
                            passwordController.text.trim()) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'اسم المستخدم او كلمة المرور غير صحيحة',
                        textAlign: TextAlign.center,
                      )));
                      return;
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Operations(
                            type: selectedOption!,
                            student: student,
                          ),
                        ));
                  });
                } else if (selectedOption == 'ولي امر') {
                  final studentsData =
                      FirebaseFirestore.instance.collection('students').get();
                  studentsData.then((value) {
                    final students = value.docs
                        .map((e) => Student.fromJson(e.data(), e.id))
                        .toList();
                    final student = students.firstWhere(
                        (element) =>
                            element.name == usernameController.text.trim(),
                        orElse: () => Student(joinDate: DateTime.now()));
                    if (student.name != usernameController.text.trim() ||
                        '${student.name.split(' ')[1]}${student.parentNumber}' !=
                            passwordController.text.trim()) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'اسم المستخدم او كلمة المرور غير صحيحة',
                        textAlign: TextAlign.center,
                      )));
                      return;
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Operations(
                            type: selectedOption!,
                            parent: student,
                          ),
                        ));
                  });
                }
              },
              child: Text(
                'تسجيل الدخول',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoKufiArabic(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
