import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutuby/main.dart';
import 'package:kutuby/models/book.dart';
import 'package:kutuby/providers/book_provider.dart';
import 'package:kutuby/screens/book_list.dart';

class AddBook extends ConsumerStatefulWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  ConsumerState<AddBook> createState() => _AddBookState();
}

class _AddBookState extends ConsumerState<AddBook> {
  @override
  void initState() {
    super.initState();
    specializations =
        ref.read(bookProvider.notifier).specializations.values.first;
  }

  final _formKey = GlobalKey<FormState>();
  String collageController = '';
  String specializationController = '';
  final bookNameController = TextEditingController();
  final authorController = TextEditingController();
  final yearPrintedController =
      TextEditingController.fromValue((const TextEditingValue(text: '2023')));
  final contactController = TextEditingController();
  bool showName = true;
  File? bookImage;
  bool imageError = false;
  bool isLoading = false;
  ContactType contactType = ContactType.number;
  void _doneMessage() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('حسناً', style: GoogleFonts.cairo()))
        ],
        title: Text(
          'تم إضافة الكتاب بنجاح',
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> _onSubmit() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (bookImage == null) {
        setState(() {
          imageError = true;
          isLoading = false;
        });
        return;
      }
      if (_formKey.currentState!.validate()) {
        String url = '';
        final storage = FirebaseStorage.instance
            .ref()
            .child(DateTime.now().millisecondsSinceEpoch.toString());
        await storage.putFile(bookImage!);
        url = await storage.getDownloadURL();
        FirebaseFirestore.instance.collection('books').add({
          //TODO edit it with the log in thing link firebase
          'user': {
            "publicName": showName,
            "name": user!.displayName,
            "id": user!.uid,
            "avatar": user!.photoURL
          },
          'categoryName': collageController,
          'specializationName': specializationController,
          "specializationId": ref
              .watch(bookProvider.notifier)
              .specializationsID[specializationController],
          'name': bookNameController.text,
          'author': authorController.text,
          'printingYear': yearPrintedController.text,
          'methodOfContact': {
            'name': contactType.name,
            'data': {contactType.name: contactController.text}
          },
          'createdAt': DateTime.now(),
          "categoryId":
              ref.watch(bookProvider.notifier).categoriesID[collageController],
          'imageUrl': url,
        });
        _doneMessage();
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Set<String> specializations = {};
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(bookProvider.notifier).specializations.keys;
    if (collageController == '') {
      collageController = categories.first;
    }
    if (specializations.isEmpty) {
      specializationController = collageController;
    }
    if (specializationController == '') {
      specializationController = specializations.first;
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'إضافة كتاب',
            style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(5),
                        border: const Border.fromBorderSide(BorderSide(
                          color: Color.fromARGB(255, 202, 201, 201),
                          width: 0.5,
                        ))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'الكلية',
                          style: GoogleFonts.cairo(),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: const Border.fromBorderSide(BorderSide(
                                color: Color.fromARGB(255, 202, 201, 201),
                                width: 0.5,
                              ))),
                          child: DropdownButton(
                              isExpanded: true,
                              underline: const SizedBox(),
                              value: collageController,
                              items: [
                                for (var cat in categories)
                                  DropdownMenuItem(
                                    alignment: Alignment.centerRight,
                                    value: cat,
                                    child: Text(
                                      cat,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(),
                                    ),
                                  ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  collageController = value!;
                                  specializations = ref
                                          .watch(bookProvider.notifier)
                                          .specializations[collageController] ??
                                      {};
                                  specializationController =
                                      specializations.firstOrNull ??
                                          collageController;
                                });
                              }),
                        ),
                        if (specializations.isNotEmpty) ...[
                          const SizedBox(height: 10),
                          Text(
                            'الاختصاص',
                            style: GoogleFonts.cairo(),
                          ),
                          const SizedBox(height: 10),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      const Border.fromBorderSide(BorderSide(
                                    color: Color.fromARGB(255, 202, 201, 201),
                                    width: 0.5,
                                  ))),
                              child: DropdownButton(
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  value: specializationController,
                                  items: [
                                    for (var spec in specializations)
                                      DropdownMenuItem(
                                        alignment: Alignment.centerRight,
                                        value: spec,
                                        child: Text(
                                          spec,
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.cairo(),
                                        ),
                                      ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      specializationController = value!;
                                    });
                                  })),
                        ]
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'اسم الكتاب',
                        style: GoogleFonts.cairo(),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().length < 3) {
                            return 'اسم الكتاب يجب ان يتكون من ثلاثه احرف على الاقل';
                          }
                          return null;
                        },
                        controller: bookNameController,
                        onTapOutside: (event) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(fontSize: 14),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'اسم المؤلف',
                        style: GoogleFonts.cairo(),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().length < 3) {
                            return 'اسم المؤلف يجب ان يتكون من ثلاثه احرف على الاقل';
                          }
                          return null;
                        },
                        controller: authorController,
                        onTapOutside: (event) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(fontSize: 14),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'سنة الطباعة',
                        style: GoogleFonts.cairo(),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        //todo edit
                        validator: (value) {
                          if (value == null || value.trim().length != 4) {
                            return 'الرجاء ادخال قيمه صالحه';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: yearPrintedController,
                        onTapOutside: (event) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(fontSize: 14),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    ':تريد أن يتم التواصل معك من خلال',
                    style: GoogleFonts.cairo(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(5),
                        border: const Border.fromBorderSide(BorderSide(
                          color: Color.fromARGB(255, 202, 201, 201),
                          width: 0.5,
                        ))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'هاتف',
                              style: GoogleFonts.cairo(),
                            ),
                            Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: ContactType.number,
                              groupValue: contactType,
                              onChanged: (value) {
                                setState(() {
                                  contactType = ContactType.number;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'البريد الإلكتروني',
                              style: GoogleFonts.cairo(),
                            ),
                            Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: ContactType.email,
                              groupValue: contactType,
                              onChanged: (value) {
                                setState(() {
                                  contactType = ContactType.email;
                                });
                              },
                            ),
                          ],
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().length < 5) {
                              return 'الرجاء ادخال قيمة صحيحه';
                            }
                            return null;
                          },
                          controller: contactController,
                          onTapOutside: (event) =>
                              FocusScope.of(context).requestFocus(FocusNode()),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.cairo(fontSize: 14),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide()),
                              hintStyle: GoogleFonts.cairo(fontSize: 14),
                              contentPadding: const EdgeInsets.all(5),
                              hintText: contactType == ContactType.number
                                  ? 'ادخل الرقم الهاتف'
                                  : 'ادخل البريد الإلكتروني'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'عرض اسمك للآخرين',
                        style: GoogleFonts.cairo(),
                      ),
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: showName,
                        onChanged: (value) {
                          setState(() {
                            showName = !showName;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width - 100,
                          height: 200,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.fromBorderSide(BorderSide(
                                color: imageError
                                    ? Colors.red
                                    : const Color.fromARGB(255, 202, 201, 201),
                                width: 0.5,
                              ))),
                          child: bookImage == null
                              ? OutlinedButton.icon(
                                  style: FilledButton.styleFrom(
                                      side: const BorderSide(
                                          width: 0.5, color: Colors.grey),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  label: Text(
                                    'رفع صورة الكتاب',
                                    style: GoogleFonts.cairo(
                                        color: imageError ? Colors.red : null,
                                        fontSize: imageError ? 25 : null),
                                  ),
                                  onPressed: () async {
                                    final image = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (image != null) {
                                      setState(() {
                                        bookImage = File(image.path);
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.camera,
                                      color: imageError ? Colors.red : null),
                                )
                              : Image.file(bookImage!)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: const Border.fromBorderSide(BorderSide(
                          color: Color(0xFFEF4444),
                          width: 0.5,
                        ))),
                    child: Text.rich(
                        TextSpan(children: [
                          const TextSpan(
                            text:
                                'ملاحظة\nيرجى حذف الكتاب بعد إعطائه للآخرين منعاً من تكدس الكتب, ',
                          ),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookList(
                                          mine: true,
                                          books: ref
                                              .watch(bookProvider.notifier)
                                              .getAllBooks()
                                              .where((element) =>
                                                  element.userID == user!.uid)
                                              .toList(),
                                        ),
                                      ));
                                },
                              text: 'اضغط هنا لحذف كتاب سابق',
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold))
                        ]),
                        style: GoogleFonts.cairo(
                          color: const Color(0xFFEF4444),
                        ),
                        textAlign: TextAlign.right,
                        softWrap: true),
                  ),
                  const SizedBox(height: 10),
                  FilledButton.icon(
                      style: FilledButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: isLoading ? null : _onSubmit,
                      icon: isLoading
                          ? const CircularProgressIndicator()
                          : const Icon(Icons.add),
                      label: Text(
                        'إضافة',
                        style: GoogleFonts.cairo(fontSize: 14),
                      )),
                ],
              ),
            )));
  }
}
