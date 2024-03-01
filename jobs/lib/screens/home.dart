import 'package:flutter/material.dart';
import 'package:jobs/screens/need_work.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _userType = 'شركة مختصة';
  String? _workType = 'تصميم';
  String? _work = 'تصميم داخلي';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text('نوع المستخدم'),
            const SizedBox(height: 10),
            DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              iconEnabledColor: Theme.of(context).colorScheme.primary,
              value: _userType,
              onChanged: (String? value) {
                setState(() {
                  _userType = value;
                });
              },
              items: _userTypes
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: 'تصميم',
                    groupValue: _workType,
                    onChanged: (String? value) {
                      setState(() {
                        _workType = 'تصميم';
                        _work = _designWorks[0];
                      });
                    }),
                const Text('تصميم'),
                const SizedBox(width: 50),
                Radio(
                    value: 'تنفيذ',
                    groupValue: _workType,
                    onChanged: (String? value) {
                      setState(() {
                        _workType = 'تنفيذ';
                        _work = _executionWorks[0];
                      });
                    }),
                const Text('تنفيذ'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('نوع العمل'),
            const SizedBox(height: 10),
            DropdownButton(
                items: _workType == 'تصميم'
                    ? _designWorks
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList()
                    : _executionWorks
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                icon: const Icon(Icons.arrow_drop_down),
                iconEnabledColor: Theme.of(context).colorScheme.primary,
                value: _work,
                onChanged: (value) {
                  setState(() {
                    _work = value;
                  });
                }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const NeedWork()));
              },
              child: const Text('تسجيل الدخول'),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> _userTypes = [
    'شركة مختصة',
    'مقاول مختص مع فريق تنفيذ',
    'عامل حر محترف',
  ];
  final List<String> _designWorks = [
    'تصميم داخلي',
    'تصميم حدائق',
    'تصميم مطابخ',
    'تصميم حمام',
    'تصميم هندسي معماري',
  ];
  final List<String> _executionWorks = [
    'منجرة محترفة تنفيذ ديكورات',
    'تنفيذ حدائق و تنسيق',
    'صبغ ورق جدران',
    'جبس بورد حوائط واسقف',
    "تنفيذ الكهرباء إحتراف",
    "تنفيذ صحي احتراف",
    "بردايات",
    "تركيب الأرضيات",
    "تنفيذ رخام ومغاسل",
    "مش واضح",
  ];
}
