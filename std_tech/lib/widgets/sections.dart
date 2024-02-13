import 'package:flutter/material.dart';

class Sections extends StatefulWidget {
  @override
  State<Sections> createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  int _selectedIndex = 0;
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
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                  child:
                      //creat a gird view with 2 columns
                      Container(
                color: Color(0xffF8F9FD),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        width: double.infinity,
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                color: _selectedIndex == index
                                    ? Color(0xffF8F9FD)
                                    : Color(0xff399679),
                                border: Border.all(
                                  width: 2,
                                  color: _selectedIndex == index
                                      ? Color(0xff399679)
                                      : Color(0xffF8F9FD),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                subjects[index],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: _selectedIndex == index
                                        ? Color(0xff399679)
                                        : Color(0xffF8F9FD),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          itemCount: subjects.length,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          padding:
                              EdgeInsets.only(top: 20, left: 20, right: 20),
                          children: [
                            //creat a card
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 1'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 2'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 3'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 4'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 5'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 6'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 7'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 8'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 9'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 10'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 11'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 12'),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text('Card 13'),
                                ],
                              ),
                            ),
                            Card(
                                child: Column(
                              children: [],
                            ))
                          ]),
                    ),
                  ],
                ),
              )),
            ]),
          ),
        ],
      ),
      Positioned(
        top: 300,
        right: -30,
        child: Transform.rotate(
          angle: -1.57,
          child: Transform.scale(
            scale: 0.8,
            child: ElevatedButton.icon(
                onPressed: () {
                  //show drawer
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.arrow_drop_down),
                label: Text(
                  'المواد',
                  style: TextStyle(fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff399679),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  fixedSize: Size(80, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.all(5),
                )),
          ),
        ),
      )
    ]);
  }
}
