import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  Account({this.imageUrl = 'sss', this.userName = 'm3tasem'});

  final String imageUrl;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
        color: Color(0xffF8F9FD),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                          userName,
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
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 380,
                child: Column(
                  children: [
                    // create a container for current balance
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.attach_money,
                              size: 50,
                              color: Theme.of(context).primaryColor,
                            ),
                            radius: 25,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'الرصيد الحالي',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 15),
                              Text(
                                '  1000',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    background: Paint()
                                      ..color = Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    fontSize: 30),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon:
                                Icon(Icons.add, color: Colors.white, size: 40),
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.notifications),
                        radius: 25,
                        backgroundColor: Colors.grey.shade200,
                      ),
                      title: Text('الاشعارات',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        'عرض الاشعارات',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.settings),
                        radius: 25,
                        backgroundColor: Colors.grey.shade200,
                      ),
                      title: Text('الاعدادات',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        'تعديل الاعدادات',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Icon(Icons.logout),
                        radius: 25,
                        backgroundColor: Colors.grey.shade200,
                      ),
                      title: Text('تسجيل الخروج',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        'تسجيل الخروج من التطبيق',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              // create a filled button to subscribe to premium
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('اشتراك بالعضوية المميزة'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
