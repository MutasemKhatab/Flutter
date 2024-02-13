import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({Key? key}) : super(key: key);

  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  List subjects = [
    'رياضيات',
    'علوم',
    'لغة عربية',
    'لغة انجليزية',
    'لغة فرنسية',
    'تاريخ',
    'جغرافيا',
    'فيزياء',
    'كيمياء',
    'احياء',
    'فلسفة',
    'اقتصاد',
    'احصاء',
    'تربية رياضية',
    'تربية فنية',
    'تربية موسيقية',
    'تربية اسلامية',
    'تربية مدنية',
    'تربية عسكرية',
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Colors.white,
        height: 75,
        width: MediaQuery.sizeOf(context).width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => setState(() {
              selected = index;
            }),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 50),
              decoration: BoxDecoration(
                color: index == selected ? Colors.white : Color(0x55E3E3E3),
                border: Border(
                  top: selected == index
                      ? BorderSide(width: 3.0, color: Color(0xffFEE502))
                      : BorderSide(width: 1.0, color: Color(0xffBDBDBD)),
                  left: BorderSide(width: 1.0, color: Color(0xffBDBDBD)),
                ),
              ),
              alignment: Alignment.center,
              width: 75,
              height: 75,
              child: Text(
                subjects[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          itemCount: subjects.length,
        ),
      ),
    );
  }
}
