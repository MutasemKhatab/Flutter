import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaimaa/models/student.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key, this.isAdd = false, this.student});
  final bool isAdd;
  final Student? student;

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final nameController = TextEditingController();

  final loopNameController = TextEditingController();

  final teacherNameController = TextEditingController();

  final qualificationController = TextEditingController();

  DateTime joinDate = DateTime.now();

  final saveController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final parentPhoneNumberController = TextEditingController();

  final locationController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (!widget.isAdd) {
      nameController.text = widget.student?.name ?? '';
      loopNameController.text = widget.student?.loop ?? '';
      teacherNameController.text = widget.student?.teacher ?? '';
      qualificationController.text = widget.student?.qualification ?? '';
      joinDate = widget.student?.joinDate ?? DateTime.now();
      saveController.text = widget.student?.save ?? '';
      phoneNumberController.text = widget.student?.number ?? '';
      parentPhoneNumberController.text = widget.student?.parentNumber ?? '';
      locationController.text = widget.student?.location ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('بيانات الطالبة '),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const Text(
                'اسم الطالبة رباعيا',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: nameController,
                onTapOutside: (event) =>
                    FocusScope.of(context).requestFocus(FocusNode()),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'اسم الطالبة رباعيا',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'اسم الحلقة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: loopNameController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'اسم الحلقة',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'اسم المعلمة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: teacherNameController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'اسم المعلمة',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'المؤهل',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: qualificationController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'المؤهل',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'تاريخ الالتحاق بالحلقة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: joinDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    setState(() {
                      joinDate = date;
                    });
                  }
                },
                child: Text(
                  '${joinDate.year}-${joinDate.month}-${joinDate.day}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'مقدار الحفظ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: saveController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'مقدار الحفظ',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'رقم جوالها',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'رقم جوالها',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'رقم ولي أمرها',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: parentPhoneNumberController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'رقم ولي أمرها',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'عنوان السكن',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'عنوان السكن',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Theme.of(context).primaryColorDark,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  if (nameController.text.isEmpty ||
                      loopNameController.text.isEmpty ||
                      teacherNameController.text.isEmpty ||
                      qualificationController.text.isEmpty ||
                      saveController.text.isEmpty ||
                      phoneNumberController.text.isEmpty ||
                      parentPhoneNumberController.text.isEmpty ||
                      locationController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('الرجاء إدخال جميع الحقول'),
                      ),
                    );
                    return;
                  }
                  if (widget.isAdd) {
                    final ref = await FirebaseFirestore.instance
                        .collection('students')
                        .add({});
                    final student = Student(
                      id: ref.id,
                      name: nameController.text,
                      loop: loopNameController.text,
                      teacher: teacherNameController.text,
                      qualification: qualificationController.text,
                      joinDate: joinDate,
                      save: saveController.text,
                      number: phoneNumberController.text,
                      parentNumber: parentPhoneNumberController.text,
                      location: locationController.text,
                    );
                    await ref.set(student.toJson());
                    if (mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('تمت الإضافة بنجاح'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: const Text('حسنا'),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    final student = Student(
                      id: widget.student!.id,
                      name: nameController.text,
                      loop: loopNameController.text,
                      teacher: teacherNameController.text,
                      qualification: qualificationController.text,
                      joinDate: joinDate,
                      save: saveController.text,
                      number: phoneNumberController.text,
                      parentNumber: parentPhoneNumberController.text,
                      location: locationController.text,
                    );
                    await FirebaseFirestore.instance
                        .collection('students')
                        .doc(widget.student!.id)
                        .update(student.toJson());
                    if (mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('تم التحديث بنجاح'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: const Text('حسنا'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  widget.isAdd ? 'إضافة الطالبة' : 'تحديث',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
