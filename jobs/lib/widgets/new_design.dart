import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:jobs/widgets/text_field.dart';
import 'dart:math' as math;

class NewDesign extends StatefulWidget {
  const NewDesign({super.key});

  @override
  State<NewDesign> createState() => _NewDesignState();
}

class _NewDesignState extends State<NewDesign> {
  int _selectedIndex = 0;
  Color pickerColor = const Color(0xff443a49);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 20, bottom: 20, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('صمم لي:'),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 30,
                  width: MediaQuery.sizeOf(context).width * 0.74,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return _listContainer('تصميم داخلي', index);
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text('تصميم داخلي:'),
          const SizedBox(height: 10),
          const Text('- قياسات الصالة بالمتر'),
          const SizedBox(height: 10),
          Row(children: [
            const Expanded(
                child: MyTextField(label: 'الطول', icon: Icon(Icons.height))),
            const SizedBox(width: 20),
            Expanded(
                child: MyTextField(
                    label: 'العرض',
                    icon: Transform.rotate(
                        angle: math.pi / 2.0, child: const Icon(Icons.height))))
          ]),
          const SizedBox(height: 20),
          const Text('- نوع التصميم'),
          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  _listContainer('تصميم داخلي', index),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('- الألوان المقترحة:'),
              const SizedBox(width: 20),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    pickerColor,
                  ),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('حفظ'))
                      ],
                      actionsAlignment: MainAxisAlignment.center,
                      content: Wrap(children: [
                        ColorPicker(
                          enableAlpha: false,
                          labelTypes: const [],
                          pickerColor: pickerColor,
                          onColorChanged: (color) =>
                              setState(() => pickerColor = color),
                        ),
                      ])),
                ),
                icon: Icon(
                  Icons.color_lens_outlined,
                  color: pickerColor.computeLuminance() < 0.5
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('- ارفق صور تلهمك:'),
              const SizedBox(width: 20),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.photo_camera_back_outlined,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('- ارفق صور كروكي هندسي:'),
              const SizedBox(width: 20),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.architecture_sharp,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('- الميزانية المتوقعة:'),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text('من:'),
              SizedBox(width: 10),
              Expanded(
                  child:
                      MyTextField(label: 'من', icon: Icon(Icons.attach_money))),
              SizedBox(width: 20),
              Text('الى:'),
              SizedBox(width: 10),
              Expanded(
                  child: MyTextField(
                      label: 'الى', icon: Icon(Icons.attach_money))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listContainer(String title, int index) => GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: _selectedIndex != index
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  )
                : Border.all(
                    color: Colors.transparent,
                  ),
            color: _selectedIndex == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: _selectedIndex == index
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
}
