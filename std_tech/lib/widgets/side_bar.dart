import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border(left: BorderSide(width: 1, color: Color(0xFFE3E3E3)))),
      child: ListView.builder(
        // add sperator between items
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  color: index == selected
                      ? Theme.of(context).colorScheme.primary
                      : Color(0x55E3E3E3),
                  border: Border(
                    left: selected == index
                        ? BorderSide(width: 3.0, color: Colors.black)
                        : BorderSide(width: 1.0, color: Color(0xffBDBDBD)),
                    bottom: BorderSide(width: 1.0, color: Color(0xffBDBDBD)),
                  )),
              alignment: Alignment.center,
              height: 75,
              child: Text(
                'فصل\n${index + 1}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: index == selected ? Colors.black : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
