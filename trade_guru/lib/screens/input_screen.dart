import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade_guru/models/suggest.dart';
import 'package:trade_guru/providers/suggestions_provider.dart';
import 'package:trade_guru/widgets/my_text_field.dart';

class InputScreen extends ConsumerStatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends ConsumerState<InputScreen> {
  final currencyController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final slController = TextEditingController();
  final tpController = TextEditingController();
  List<String> tpList = [];
  String isBuy = 'Buy';

  bool isUploading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF131723),
        foregroundColor: Colors.white,
        title: const Text('New Suggestion'),
      ),
      backgroundColor: const Color(0xFF0A0A0A),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextField(
                label: "Currency",
                icon: Icons.currency_exchange,
                controller: currencyController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      label: "From",
                      icon: Icons.arrow_downward,
                      controller: fromController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyTextField(
                      label: "To",
                      icon: Icons.arrow_upward,
                      controller: toController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MyTextField(
                label: "SL",
                icon: Icons.back_hand_outlined,
                controller: slController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      label: "TP",
                      icon: Icons.golf_course_outlined,
                      controller: tpController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        if (tpController.text.isEmpty) return;
                        setState(() {
                          tpList.add(tpController.text);
                          tpController.clear();
                        });
                      },
                      icon: const Icon(Icons.add, color: Colors.white)),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: tpList.isNotEmpty ? 30 : 0,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: const Color(0xFF131723),
                child: ListView.separated(
                    separatorBuilder: (context, index) => Container(
                          width: 1,
                          color: Colors.white.withOpacity(0.2),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 0),
                        ),
                    scrollDirection: Axis.horizontal,
                    itemCount: tpList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('TP${index + 1} ${tpList[index]}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tpList.removeAt(index);
                              });
                            },
                            child: const SizedBox(
                              height: 20,
                              width: 20,
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFF131723),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  dropdownColor: const Color(0xFF131723),
                  value: isBuy,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.white),
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      isBuy = newValue!;
                    });
                  },
                  items: <String>['Buy', 'Sell']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'jura')),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (isUploading) return;
                    if (currencyController.text.isEmpty ||
                        fromController.text.isEmpty ||
                        toController.text.isEmpty ||
                        slController.text.isEmpty ||
                        tpList.isEmpty) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          content: const Text('Fill all fields')));
                      return;
                    }
                    setState(() {
                      isUploading = true;
                    });
                    final suggest = Suggest(
                      id: '',
                      type: 'Active',
                      points: '0',
                      currency: currencyController.text,
                      fromTo: '${fromController.text} - ${toController.text}',
                      isBuy: isBuy == 'Buy',
                      sl: slController.text,
                      date: DateTime.now(),
                      tpList: tpList,
                    );
                    ref
                        .watch(suggestionProvider.notifier)
                        .addSuggestion(suggest);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: isUploading
                      ? const CircularProgressIndicator()
                      : const Text('Submit',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
