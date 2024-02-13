import 'package:flutter/material.dart';
import 'package:std_tech/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedStage = 'ابتدائي';
  String user = 'طالب';
  int _selectedIndex = 0;
  int len = 6;
  int start = 1;
  bool isVisable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: Theme.of(context).colorScheme.primary,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 70, right: 20, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'الاسم',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'المرحلة الدراسية',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                            value: 'ابتدائي',
                            groupValue: _selectedStage,
                            onChanged: (value) {
                              setState(() {
                                isVisable = true;
                                _selectedIndex = 0;
                                len = 6;
                                start = 1;
                                _selectedStage = value.toString();
                              });
                            }),
                        Text('ابتدائي'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                            value: 'متوسط',
                            groupValue: _selectedStage,
                            onChanged: ((value) => setState(() {
                                  isVisable = true;
                                  _selectedIndex = 0;
                                  len = 3;
                                  start = 1;
                                  _selectedStage = value.toString();
                                }))),
                        Text('متوسط'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Theme.of(context).colorScheme.secondary,
                          value: 'اعدادي',
                          groupValue: _selectedStage,
                          onChanged: ((value) => setState(() {
                                isVisable = true;
                                _selectedIndex = 0;
                                len = 3;
                                start = 4;
                                _selectedStage = value.toString();
                              })),
                        ),
                        Text('اعدادي'),
                      ],
                    ),
                  ],
                ),
                if (isVisable)
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 100,
                    child: ListView.builder(
                      itemCount: len,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                            isVisable = false;
                          });
                        },
                        child: Card(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('$_selectedStage\n${index + start}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _selectedIndex == index
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Colors.white,
                                      fontSize: 20,
                                    ))),
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onTapOutside: (event) =>
                      FocusScope.of(context).requestFocus(FocusNode()),
                  decoration: InputDecoration(
                    labelText: 'المنطقة',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'المدرسة',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Theme.of(context).colorScheme.secondary,
                          value: 'طالب',
                          groupValue: user,
                          onChanged: ((value) => setState(() {
                                user = value.toString();
                              })),
                        ),
                        Text('طالب'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Theme.of(context).colorScheme.secondary,
                          value: 'معلم',
                          groupValue: user,
                          onChanged: ((value) => setState(() {
                                user = value.toString();
                              })),
                        ),
                        Text('معلم'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      fixedSize:
                          Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
