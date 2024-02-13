import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shaimaa/models/report.dart';
import 'package:shaimaa/models/student.dart';
import 'package:shaimaa/models/teacher.dart';
import 'package:shaimaa/screens/add_teacher.dart';
import 'package:shaimaa/screens/add_student.dart';
import 'package:shaimaa/screens/list.dart';
import 'package:shaimaa/screens/report.dart';

class Operations extends StatelessWidget {
  const Operations({
    required this.type,
    super.key,
    this.parent,
    this.teacher,
    this.student,
  });
  final String type;
  final Student? parent;
  final Student? student;
  final Teacher? teacher;
  static const spacer = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    String appBarTitle = '';
    List<Widget> actions = [];
    String icon = '';
    if (type == 'ولي امر') {
      appBarTitle = 'مرحبا ${parent!.name.split(' ')[1]}';
      actions.add(_getWeeklyReport(context));
      actions.add(spacer);
      actions.add(_getMonthlyReport(context));
      actions.add(spacer);
      actions.add(_getNotes(context));
      icon = 'parent';
    } else if (type == 'طالبة') {
      actions.add(ColoredBox(
        color: Theme.of(context).colorScheme.surface,
        child: Text(
          'اسم الطالبة: ${student!.name.split(' ')[0]}',
          style: TextStyle(
              height: 2,
              color: Theme.of(context).primaryColorDark,
              fontSize: 20),
        ),
      ));
      actions.add(spacer);
      actions.add(ColoredBox(
        color: Theme.of(context).colorScheme.surface,
        child: Text(
          'رقم الطالبة: ${student!.number}',
          style: TextStyle(
              height: 2,
              color: Theme.of(context).primaryColorDark,
              fontSize: 20),
        ),
      ));
      actions.add(spacer);
      actions.add(_getWeeklyReport(context));
      actions.add(spacer);
      actions.add(_getMonthlyReport(context));
      icon = 'student';
    } else if (type == 'معلمة') {
      appBarTitle = 'مرحبا استاذة ${teacher!.name}';
      actions.add(_setMonthlyReport(context));
      actions.add(spacer);
      actions.add(_setWeeklyReport(context));
      icon = 'teacher';
    } else if (type == 'الإدارة') {
      appBarTitle = 'ادارة مركز الشيماء';
      icon = 'admin';
      actions.add(_manageTeachers(context));
      actions.add(spacer);
      actions.add(_manageStudents(context));
      actions.add(spacer);
      actions.add(_manageReports(context));
      actions.add(spacer);
      actions.add(_manageAds(context));
      actions.add(spacer);
      actions.add(_addNotes(context));
      actions.add(spacer);
      actions.add(_addContactNumber(context));
    } else {
      return const SizedBox();
    }
    return PopScope(
      child: Scaffold(
          appBar: AppBar(
              leading: const SizedBox(),
              title: Text(appBarTitle),
              centerTitle: true,
              actions: [
                SvgPicture.asset(
                  'assets/icons/$icon.svg',
                  width: 50,
                  height: 50,
                ),
              ]),
          body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back1.jpg'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
          )),
    );
  }

  Widget _getNotes(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () async {
        bool noNotes = true;
        await FirebaseFirestore.instance
            .collection('notes')
            .get()
            .then((value) {
          for (var doc in value.docs) {
            if (doc.id == (student ?? parent!).number) {
              noNotes = false;
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'ملاحظات',
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    doc.data()['notes'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            }
          }
        });
        if (!context.mounted) return;
        if (noNotes) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text(
                'ملاحظات',
                textAlign: TextAlign.center,
              ),
              content: Text(
                'لا يوجد ملاحظات',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
      child: const Text(
        'ملاحظات',
        style: TextStyle(fontSize: 20),
      ));

  Widget _getMonthlyReport(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 60),
            foregroundColor: const Color(0xFF5F2E8E),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () async {
          bool noReports = true;
          await FirebaseFirestore.instance
              .collection('reports')
              .get()
              .then((value) {
            for (var doc in value.docs) {
              if (doc.data()['studentNumber'] == (student ?? parent!).number &&
                  doc.data()['type'] == 'شهري') {
                noReports = false;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ReportScreen(
                        isAdd: false,
                        reportType: 'شهري',
                        isView: true,
                        report: Report.fromJson(doc.data(), doc.id))));
              }
            }
          });
          if (!context.mounted) return;
          if (noReports) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text(
                  'التقرير الشهري',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  'لا يوجد تقرير شهري',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }
        },
        child: const Text(
          'التقرير الشهري',
          style: TextStyle(fontSize: 20),
        ),
      );

  Widget _getWeeklyReport(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () async {
        bool noReports = true;
        await FirebaseFirestore.instance
            .collection('reports')
            .get()
            .then((value) {
          for (var doc in value.docs) {
            if (doc.data()['studentNumber'] == (student ?? parent!).number &&
                doc.data()['type'] == 'اسبوعي') {
              noReports = false;
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReportScreen(
                      isAdd: false,
                      reportType: 'اسبوعي',
                      isView: true,
                      report: Report.fromJson(doc.data(), doc.id))));
            }
          }
        });
        if (!context.mounted) return;
        if (noReports) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text(
                'التقرير الاسبوعي',
                textAlign: TextAlign.center,
              ),
              content: Text(
                'لا يوجد تقرير اسبوعي',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
      child: const Text(
        'التقرير الأسبوعي',
        style: TextStyle(fontSize: 20),
      ));

  Widget _setMonthlyReport(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ReportScreen(
            isAdd: true,
            reportType: 'شهري',
          ),
        ));
      },
      child: const Text(
        'رفع التقرير الشهري',
        style: TextStyle(fontSize: 20),
      ));

  Widget _setWeeklyReport(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ReportScreen(
            isAdd: true,
            reportType: 'اسبوعي',
          ),
        ));
      },
      child: const Text(
        'رفع التقرير الأسبوعي',
        style: TextStyle(fontSize: 20),
      ));

  Widget _manageReports(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    'ادارة التقارير',
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ListScreen(
                              isView: true,
                              title: 'التقارير',
                            ),
                          ));
                        },
                        child: const Text('عرض التقارير')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ReportScreen(
                              isAdd: true,
                              reportType: 'اسبوعي',
                            ),
                          ));
                        },
                        child: const Text('اضافه تقرير الاسبوعي')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ReportScreen(
                              isAdd: true,
                              reportType: 'شهري',
                            ),
                          ));
                        },
                        child: const Text('اضافه تقرير الشهري')),
                    // delete report navigate to list screen
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ListScreen(
                              isView: false,
                              title: 'التقارير',
                            ),
                          ));
                        },
                        child: const Text('حذف تقرير')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('اغلاق')),
                  ],
                ));
      },
      child: const Text(
        'ادارة التقارير',
        style: TextStyle(fontSize: 20),
      ));

  Widget _manageTeachers(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) =>
                // show alert dialog to add teacher,delete teacher
                AlertDialog(
                  title:
                      const Text('ادارة المعلمات', textAlign: TextAlign.center),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListScreen(
                                  isView: true,
                                  title: 'المعلمات',
                                ),
                              ));
                        },
                        child: const Text('عرض/تحديث معلومات معلمة')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddTeacherScreen(),
                              ));
                        },
                        child: const Text('اضافة معلمة')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ListScreen(
                                    isView: false,
                                    title: 'المعلمات',
                                  )));
                        },
                        child: const Text('حذف معلمة')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('اغلاق')),
                  ],
                ));
      },
      child: const Text(
        'ادارة المعلمات',
        style: TextStyle(fontSize: 20),
      ));

  Widget _manageStudents(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) =>
                // show alert dialog to add student,delete student
                AlertDialog(
                  title:
                      const Text('ادارة الطالبات', textAlign: TextAlign.center),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListScreen(
                                  isView: true,
                                  title: 'الطالبات',
                                ),
                              ));
                        },
                        child: const Text('عرض/تحديث معلومات طالبة')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddStudentScreen(
                                  isAdd: true,
                                ),
                              ));
                        },
                        child: const Text('اضافة طالبة')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ListScreen(
                                    isView: false,
                                    title: 'الطالبات',
                                  )));
                        },
                        child: const Text('حذف طالبة')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('اغلاق')),
                  ],
                ));
      },
      child: const Text(
        'ادارة الطالبات',
        style: TextStyle(fontSize: 20),
      ));

  Widget _manageAds(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        XFile? image;
        String action = 'يوتيوب';
        final TextEditingController controller = TextEditingController();
        bool showImagePicker = false;
        showDialog(
            context: context,
            builder: (context) => StatefulBuilder(
                  builder: (context, setState) => AlertDialog(
                    title: const Text(
                      'ادارة الاعلانات',
                      textAlign: TextAlign.center,
                    ),
                    content: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //create a dropdown button to select the type managing يوتيوب,انستقرام,ويب,جوجل ماب
                            DropdownButton(
                              value: action,
                              items: const [
                                DropdownMenuItem(
                                  value: 'يوتيوب',
                                  child: Text('يوتيوب'),
                                ),
                                DropdownMenuItem(
                                  value: 'فيسبوك',
                                  child: Text('فيسبوك'),
                                ),
                                DropdownMenuItem(
                                  value: 'ويب',
                                  child: Text('ويب'),
                                ),
                                DropdownMenuItem(
                                  value: 'جوجل ماب',
                                  child: Text('جوجل ماب'),
                                ),
                                DropdownMenuItem(
                                  value: 'اعلان نص',
                                  child: Text('اعلان نص'),
                                ),
                                DropdownMenuItem(
                                  value: 'اعلان صورة',
                                  child: Text('اعلان صورة'),
                                ),
                                DropdownMenuItem(
                                  value: 'عن المركز',
                                  child: Text('عن المركز'),
                                ),
                                DropdownMenuItem(
                                  value: 'رابط التطبيق',
                                  child: Text('رابط التطبيق'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  action = value!;
                                  if (value == 'اعلان صورة') {
                                    showImagePicker = true;
                                  } else {
                                    showImagePicker = false;
                                  }
                                });
                              },
                            ),
                            if (showImagePicker)
                              OutlinedButton(
                                  onPressed: () async {
                                    image = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                  },
                                  child: const Text('اختيار صورة')),
                            if (!showImagePicker)
                              TextField(
                                controller: controller,
                                decoration: const InputDecoration(
                                  hintText: 'ادخل القيمة هنا',
                                ),
                              )
                          ],
                        )),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('اغلاق')),
                      TextButton(
                          onPressed: () async {
                            if (action == 'اعلان صورة') {
                              if (image == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('لم يتم اختيار صورة')));
                                return;
                              } else {
                                Navigator.of(context).pop();
                                final fbFile = FirebaseStorage.instance
                                    .ref()
                                    .child('adImage.jpeg');
                                await fbFile.putFile(File(image!.path));
                                await FirebaseFirestore.instance
                                    .collection('ad')
                                    .doc('theAd')
                                    .set({
                                  'content': await fbFile.getDownloadURL(),
                                  'type': 'image'
                                });
                              }
                            } else if (action == 'اعلان نص') {
                              if (controller.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('الرجاء ادخال نص')));
                                return;
                              } else {
                                Navigator.of(context).pop();
                                await FirebaseFirestore.instance
                                    .collection('ad')
                                    .doc('theAd')
                                    .set({
                                  'content': controller.text,
                                  'type': 'text'
                                });
                              }
                            } else if (action == 'رابط التطبيق') {
                              if (controller.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('الرجاء ادخال رابط التطبيق')));
                                return;
                              } else {
                                Navigator.of(context).pop();
                                await FirebaseFirestore.instance
                                    .collection('contact')
                                    .doc('info')
                                    .set({
                                  'share': controller.text,
                                }, SetOptions(merge: true));
                              }
                            } else if (action == 'يوتيوب') {
                              if (controller.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'الرجاء ادخال رابط اليوتيوب')));
                                return;
                              } else {
                                Navigator.of(context).pop();
                                await FirebaseFirestore.instance
                                    .collection('contact')
                                    .doc('info')
                                    .set({
                                  'youtube': controller.text,
                                }, SetOptions(merge: true));
                              }
                            } else if (action == 'فيسبوك') {
                              if (controller.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'الرجاء ادخال رابط الفيسبوك')));
                                return;
                              } else {
                                Navigator.of(context).pop();
                                await FirebaseFirestore.instance
                                    .collection('contact')
                                    .doc('info')
                                    .set({
                                  'facebook': controller.text,
                                }, SetOptions(merge: true));
                              }
                            } else if (action == 'ويب') {
                              if (controller.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('الرجاء ادخال رابط الموقع')));
                                return;
                              } else {
                                Navigator.of(context).pop();
                                await FirebaseFirestore.instance
                                    .collection('contact')
                                    .doc('info')
                                    .set({
                                  'web': controller.text,
                                }, SetOptions(merge: true));
                              }
                            } else if (action == 'جوجل ماب') {
                              if (controller.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'الرجاء ادخال رابط جوجل ماب')));
                                return;
                              } else {
                                Navigator.of(context).pop();
                                await FirebaseFirestore.instance
                                    .collection('contact')
                                    .doc('info')
                                    .set({
                                  'googleMap': controller.text,
                                }, SetOptions(merge: true));
                              }
                            } else if (action == 'عن المركز') {
                              if (controller.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('الرجاء ادخال نص عن المركز')));
                                return;
                              } else {
                                Navigator.of(context).pop();
                                await FirebaseFirestore.instance
                                    .collection('contact')
                                    .doc('info')
                                    .set({
                                  'about': controller.text,
                                }, SetOptions(merge: true));
                              }
                            }
                          },
                          child: const Text(
                            'حفظ',
                          )),
                    ],
                  ),
                ));
      },
      child: const Text(
        'ادارة الاعلانات',
        style: TextStyle(fontSize: 20),
      ));
  Widget _addContactNumber(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        final TextEditingController controller = TextEditingController();
        String type = 'واتساب';
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    'اضافة رقم الاتصال',
                    textAlign: TextAlign.center,
                  ),
                  content: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButton(
                          value: type,
                          items: const [
                            DropdownMenuItem(
                              value: 'واتساب',
                              child: Text('واتساب'),
                            ),
                            DropdownMenuItem(
                              value: 'اتصال',
                              child: Text('اتصال'),
                            ),
                            DropdownMenuItem(
                              value: 'رسالة',
                              child: Text('رسالة'),
                            ),
                            DropdownMenuItem(
                              value: 'حساب بنكي',
                              child: Text('حساب بنكي'),
                            ),
                          ],
                          onChanged: (value) {
                            type = value!;
                          },
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'ادخل رقم الاتصال هنا',
                          ),
                        ),
                      ],
                    ),
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('اغلاق')),
                    TextButton(
                        onPressed: () async {
                          if (controller.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('الرجاء ادخال رقم الاتصال')));
                            return;
                          }
                          Navigator.of(context).pop();
                          if (type == 'حساب بنكي') {
                            await FirebaseFirestore.instance
                                .collection('bankAccounts')
                                .doc()
                                .set({
                              'account': controller.text,
                            });
                            return;
                          } else if (type == 'رسالة') {
                            await FirebaseFirestore.instance
                                .collection('numbers')
                                .doc('sms')
                                .set({
                              'sms': controller.text,
                            });
                            return;
                          } else if (type == 'اتصال') {
                            await FirebaseFirestore.instance
                                .collection('numbers')
                                .doc('call')
                                .set({
                              'call': controller.text,
                            });
                            return;
                          } else if (type == 'واتساب') {
                            await FirebaseFirestore.instance
                                .collection('numbers')
                                .doc('whatsapp')
                                .set({
                              'whatsapp': controller.text,
                            });
                            return;
                          }
                        },
                        child: const Text(
                          'حفظ',
                        )),
                  ],
                ));
      },
      child: const Text(
        'اضافة رقم الاتصال',
        style: TextStyle(fontSize: 20),
      ));

  Widget _addNotes(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          foregroundColor: const Color(0xFF5F2E8E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        final studentNumberController = TextEditingController();
        final notesController = TextEditingController();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title:
                      const Text('اضافة ملاحظات', textAlign: TextAlign.center),
                  content: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: studentNumberController,
                          decoration: const InputDecoration(
                            hintText: 'رقم الطالبة',
                          ),
                        ),
                        TextField(
                          controller: notesController,
                          decoration: const InputDecoration(
                            hintText: 'اضف ملاحظاتك هنا',
                          ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('اغلاق')),
                    TextButton(
                        onPressed: () async {
                          if (studentNumberController.text.isEmpty ||
                              notesController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'الرجاء ادخال رقم الطالبة والملاحظات')));
                            return;
                          }
                          Navigator.of(context).pop();
                          await FirebaseFirestore.instance
                              .collection('notes')
                              .doc(studentNumberController.text)
                              .set({
                            'notes': notesController.text,
                          });
                        },
                        child: const Text('حفظ')),
                  ],
                ));
      },
      child: const Text(
        'اضافة ملاحظات',
        style: TextStyle(fontSize: 20),
      ));
}
