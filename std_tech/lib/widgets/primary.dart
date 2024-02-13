import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:std_tech/widgets/home_summary.dart';

class Primary extends StatefulWidget {
  const Primary({Key? key}) : super(key: key);

  @override
  _PrimaryState createState() => _PrimaryState();
}

class _PrimaryState extends State<Primary> {
  final items = const ['الملخصات', 'المراجعات', 'بودكاست'];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffF8F9FD),
        margin: EdgeInsets.all(20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                      radius: 25,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'معتصم العمري',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        // emai text
                        Text(
                          'myemail@gmail.com',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 150,
                child: CarouselSlider(
                    items: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'عرض خاص',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'اشتراك سنوي ب 50\$',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'اشتراك شهري ب 10\$',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'عرض خاص',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'اشتراك سنوي ب 50\$',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'اشتراك شهري ب 10\$',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 150,
                        enlargeCenterPage: true,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 1)),
              ),
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
                      onTap: () => setState(() {
                        selected = index;
                      }),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: selected == index
                              ? Color(0xff399679)
                              : Color(0xffF8F9FD),
                          border: Border.all(
                              color: selected == index
                                  ? Colors.transparent
                                  : Color(0xff399679),
                              width: 1.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.menu_book_sharp,
                              size: 15,
                              color: selected == index
                                  ? Colors.white
                                  : Color(0xff399679),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              items[index],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: selected == index
                                      ? Colors.white
                                      : Color(0xff399679),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: items.length,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ملخص اليوم',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //icon button share with style,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade200),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                height: 200,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://static-cse.canva.com/blob/921497/BlueOrangeandYellowCoolMemoir_InspirationalBookCover.jpg',
                        width: 100,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'رياضيات',
                          style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('افضل ملخص للرياضيات',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'الاستاذ: معتصم العمري',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff399679),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            'لوريم ايبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'خصيصا لك',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //icon button share with style,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade200),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              HomeSummary(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'لانك قرأت ملخصات رياضيات',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //icon button share with style,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade200),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              HomeSummary(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اكثر الملخصات مبيعا',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //icon button share with style,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade200),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              HomeSummary(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اكثر تقييما',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //icon button share with style,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade200),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              HomeSummary(),
            ]),
          ),
        ));
  }
}
