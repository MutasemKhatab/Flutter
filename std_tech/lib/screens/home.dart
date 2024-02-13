import 'package:flutter/material.dart';
import 'package:std_tech/widgets/account.dart';
import 'package:std_tech/widgets/my_library.dart';
import 'package:std_tech/widgets/primary.dart';
import 'package:std_tech/widgets/search.dart';
import 'package:std_tech/widgets/sections.dart';
import 'package:std_tech/widgets/side_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: SideBar(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.black,
            currentIndex: currentIndex,
            unselectedItemColor: Colors.grey,
            onTap: (value) {
              pageController.animateToPage(value,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'الرئيسية'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.widgets), label: 'الاقسام'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'البحث'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined), label: 'مكتبتي'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
            ],
          ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Primary(),
              Sections(),
              Search(),
              MyLibrary(),
              Account(),
            ],
          ),
        ),
      ),
    );
  }
}
