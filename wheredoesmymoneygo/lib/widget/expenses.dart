// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wheredoesmymoneygo/main.dart';
import 'package:wheredoesmymoneygo/widget/expense_input.dart';
import 'package:wheredoesmymoneygo/widget/expense_list/expenses_list.dart';
import 'package:wheredoesmymoneygo/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  var list = expenseData;
  void updateList() {
    setState(() {
      list = expenseData;
    });
  }

  void removeList(Expense e) {
    setState(() {
      expenseData.remove(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Expense Deleted"),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                expenseData.add(e);
              });
            })));
  }

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => ExpenseInput(updateList));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No Expenses Added"));
    if (list.isNotEmpty) {
      mainContent = ExpensesList(removeList: removeList);
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Expences Traker"), actions: [
        IconButton(
            onPressed: _openAddExpensesOverlay, icon: const Icon(Icons.add))
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: [colorScheme.background, Colors.white],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...Category.values.map(
                  (e) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 50,
                      height: Expense.getCategoryPercentage(e) * 120,
                      color: colorScheme.primary,
                      padding: EdgeInsets.all(10),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: expenseData.isEmpty
                ? []
                : Category.values
                    .toList()
                    .map((e) => Icon(
                          categoryIcons[e],
                          color: colorScheme.primary,
                        ))
                    .toList(),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
