// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wheredoesmymoneygo/model/expense.dart';

class ExpenseInput extends StatefulWidget {
  const ExpenseInput(this.updateList, {Key? key}) : super(key: key);
  final void Function() updateList;
  @override
  State<ExpenseInput> createState() => _ExpenseInputState();
}

class _ExpenseInputState extends State<ExpenseInput> {
  final _titelControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime? date;
  Category category = Category.food;
  @override
  void dispose() {
    _titelControler.dispose();
    _amountControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
              controller: _titelControler,
              maxLength: 45,
              decoration: const InputDecoration(label: Text("Expense Title"))),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountControler,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$ ",
                    label: Text("Amount"),
                  ),
                ),
              ),
              Spacer(),
              Text(date == null ? "Selected Date" : formater.format(date!)),
              IconButton(
                  onPressed: () async {
                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 1));
                    setState(() {
                      date = date;
                    });
                  },
                  icon: Icon(Icons.calendar_month_outlined))
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              DropdownButton(
                  value: category,
                  items: Category.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        category = value;
                      });
                    }
                  }),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (_titelControler.text.trim().isEmpty ||
                        double.tryParse(_amountControler.text) == null ||
                        double.tryParse(_amountControler.text)! <= 0 ||
                        date == null) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Okay"))
                                ],
                                title: Text("Invalid Input"),
                                content: Text(
                                    "Please make sure you have been entered a vaild Title, Amount and Date."),
                              ));
                      return;
                    }
                    expenseData.add(
                      Expense(_titelControler.text,
                          double.parse(_amountControler.text), date!, category),
                    );
                    widget.updateList();
                    Navigator.pop(context);
                  },
                  child: Text("Save Expense")),
            ],
          ),
        ],
      ),
    );
  }
}
