import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaimaa/models/teacher.dart';

class AddTeacherScreen extends StatefulWidget {
  const AddTeacherScreen(
      {super.key, this.isAdd = true, this.teacher = const Teacher()});
  final bool isAdd;
  final Teacher teacher;

  @override
  State<AddTeacherScreen> createState() => _AddTeacherScreenState();
}

class _AddTeacherScreenState extends State<AddTeacherScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController saveController = TextEditingController();
  String maritalStatus = 'عازبة';
  final TextEditingController boysNumController = TextEditingController();
  final TextEditingController girlsNumController = TextEditingController();
  final TextEditingController neighborhoodController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController vacationsController = TextEditingController();
  @override
  void initState() {
    super.initState();

    if (!widget.isAdd) {
      nameController.text = widget.teacher.name;
      qualificationController.text = widget.teacher.qualification;
      saveController.text = widget.teacher.save;
      maritalStatus = widget.teacher.martialStatus;
      boysNumController.text = widget.teacher.boysNum;
      girlsNumController.text = widget.teacher.girlsNum;
      neighborhoodController.text = widget.teacher.location;
      numberController.text = widget.teacher.number;
      vacationsController.text = widget.teacher.holidays;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بيانات المعلمة الجديدة'),
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
            padding: const EdgeInsets.all(16.0),
            children: [
              const Text(
                'اسم المعلمة رباعياً:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'ادخل اسم المعلمة',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'المؤهل:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: qualificationController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'ادخل المؤهل',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'مقدار الحفظ:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: saveController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'ادخل مقدار الحفظ',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'الحالة الاجتماعية:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              //create a 2 radio buttons عازب متزوجة
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'عازبة',
                    groupValue: maritalStatus,
                    onChanged: (value) {
                      setState(() => maritalStatus = value!);
                    },
                  ),
                  const Text('عازبة'),
                  const SizedBox(width: 20),
                  Radio(
                    value: 'متزوجة',
                    groupValue: maritalStatus,
                    onChanged: (value) {
                      setState(() {
                        maritalStatus = value!;
                      });
                    },
                  ),
                  const Text('متزوجة'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'الاولاد',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('عدد الذكور:', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: boysNumController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text('عدد الاناث:', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: girlsNumController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),

              const Text(
                'الحارة:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: neighborhoodController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'ادخل الحارة',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'الجوال:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.number,
                controller: numberController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'ادخل رقم الجوال',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'الإجازات:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: vacationsController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'ادخل الإجازات',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                      qualificationController.text.isEmpty ||
                      saveController.text.isEmpty ||
                      maritalStatus.isEmpty ||
                      boysNumController.text.isEmpty ||
                      girlsNumController.text.isEmpty ||
                      neighborhoodController.text.isEmpty ||
                      numberController.text.isEmpty ||
                      vacationsController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('الرجاء ملئ الحقول')));
                    return;
                  }
                  if (widget.isAdd) {
                    final doc = await FirebaseFirestore.instance
                        .collection('teachers')
                        .add({});
                    final teacher = Teacher(
                        id: doc.id,
                        boysNum: boysNumController.text,
                        girlsNum: girlsNumController.text,
                        holidays: vacationsController.text,
                        location: neighborhoodController.text,
                        martialStatus: maritalStatus,
                        name: nameController.text,
                        number: numberController.text,
                        qualification: qualificationController.text,
                        save: saveController.text);
                    await doc.set(teacher.toJson());
                    if (mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('تمت الإضافة بنجاح'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text('حسناً'),
                            )
                          ],
                        ),
                      );
                    }
                  } else {
                    final doc = FirebaseFirestore.instance
                        .collection('teachers')
                        .doc(widget.teacher.id);
                    final teacher = Teacher(
                        id: doc.id,
                        boysNum: boysNumController.text,
                        girlsNum: girlsNumController.text,
                        holidays: vacationsController.text,
                        location: neighborhoodController.text,
                        martialStatus: maritalStatus,
                        name: nameController.text,
                        number: numberController.text,
                        qualification: qualificationController.text,
                        save: saveController.text);
                    await doc.set(teacher.toJson());
                    if (mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('تم التحديث بنجاح'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text('حسناً'),
                            )
                          ],
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  widget.isAdd ? 'إضافة معلمة' : 'تحديث المعلومات',
                  style: const TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
