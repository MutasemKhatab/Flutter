import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaimaa/models/report.dart';
import 'package:shaimaa/models/student.dart';
import 'package:shaimaa/models/teacher.dart';
import 'package:shaimaa/screens/add_teacher.dart';
import 'package:shaimaa/screens/add_student.dart';
import 'package:shaimaa/screens/report.dart';

class ListScreen extends StatefulWidget {
  final String title;
  final bool isView;
  final List list;
  const ListScreen(
      {super.key,
      required this.title,
      required this.isView,
      this.list = const []});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future<List> fetchData() async {
    if (widget.list.isEmpty) {
      if (widget.title == 'المعلمات') {
        final data =
            await FirebaseFirestore.instance.collection('teachers').get();
        return data.docs.map((e) => Teacher.fromJson(e.data(), e.id)).toList();
      } else if (widget.title == 'الطالبات') {
        final data =
            await FirebaseFirestore.instance.collection('students').get();

        return data.docs.map((e) => Student.fromJson(e.data(), e.id)).toList();
      } else if (widget.title == 'التقارير') {
        final data =
            await FirebaseFirestore.instance.collection('reports').get();
        return data.docs.map((e) => Report.fromJson(e.data(), e.id)).toList();
      }
    }
    return widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            padding: const EdgeInsets.all(10),
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back3.jpg'),
                    fit: BoxFit.cover)),
            child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {},
                        ),
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'بحث',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        List result;
                        if (widget.title == 'التقارير') {
                          result = snapshot.data!.where((element) {
                            return element.title.contains(value);
                          }).toList();
                        } else {
                          result = snapshot.data!.where((element) {
                            return element.name.contains(value);
                          }).toList();
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ListScreen(
                                  list: result,
                                  title: widget.title,
                                  isView: widget.isView,
                                )));
                      },
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        color: Colors.white60,
                        child: ListTile(
                          // dynamic list tile
                          title: Text(
                              widget.title == 'التقارير'
                                  ? snapshot.data![index].title
                                  : snapshot.data![index].name,
                              style: const TextStyle(fontSize: 20)),
                          subtitle: Text(widget.title == 'التقارير'
                              ? snapshot.data![index].date
                              : snapshot.data![index].number),
                          onTap: widget.isView
                              ? () {
                                  if (widget.title == 'الطالبات') {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddStudentScreen(
                                                  isAdd: false,
                                                  student:
                                                      snapshot.data![index],
                                                )));
                                  } else if (widget.title == 'المعلمات') {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddTeacherScreen(
                                                  isAdd: false,
                                                  teacher:
                                                      snapshot.data![index],
                                                )));
                                  } else if (widget.title == 'التقارير') {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ReportScreen(
                                                  reportType: snapshot
                                                      .data![index].type,
                                                  isAdd: false,
                                                  report: snapshot.data![index],
                                                )));
                                  }
                                }
                              : null,
                          trailing: widget.isView
                              ? const SizedBox()
                              : IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text('تأكيد الحذف'),
                                              content: const Text(
                                                  'هل انت متأكد من حذف هذا العنصر؟'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('لا')),
                                                TextButton(
                                                    onPressed: () async {
                                                      if (widget.title ==
                                                          'المعلمات') {
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'teachers')
                                                            .doc(snapshot
                                                                .data![index]
                                                                .id)
                                                            .delete();
                                                        setState(() {});
                                                      } else if (widget.title ==
                                                          'الطالبات') {
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'students')
                                                            .doc(snapshot
                                                                .data![index]
                                                                .id)
                                                            .delete();
                                                        setState(() {});
                                                      }
                                                      if (widget.title ==
                                                          'التقارير') {
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'reports')
                                                            .doc(snapshot
                                                                .data![index]
                                                                .id)
                                                            .delete();
                                                        setState(() {});
                                                      }
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('نعم'))
                                              ],
                                            ));
                                  },
                                ),
                        ),
                      );
                    },
                  ))
                ]);
              },
            )),
      ),
    );
  }
}
