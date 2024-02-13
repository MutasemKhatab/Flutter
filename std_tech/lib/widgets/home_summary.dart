import 'package:flutter/material.dart';

class HomeSummary extends StatelessWidget {
  const HomeSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(5),
          width: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://static-cse.canva.com/blob/921497/BlueOrangeandYellowCoolMemoir_InspirationalBookCover.jpg',
                  width: 130,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.menu_book_sharp,
                    size: 15,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Text(
                    '10 صفحات',
                    style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  Spacer(),
                  Icon(
                    Icons.headphones,
                    size: 15,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Text(
                    '10 دقائق',
                    style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //filled button icon open book icon and ملخص text
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 70,
                  height: 30,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.menu_book_sharp, size: 15),
                    label: Text('ملخص', style: TextStyle(fontSize: 10)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      foregroundColor: Color(0xff399679),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
