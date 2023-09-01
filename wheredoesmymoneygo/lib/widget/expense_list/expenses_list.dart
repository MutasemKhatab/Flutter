// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wheredoesmymoneygo/main.dart';
import 'package:wheredoesmymoneygo/widget/expense_list/expense_item.dart';
import '../../model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.removeList, Key? key}) : super(key: key);
  final void Function(Expense e) removeList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseData.length,
      itemBuilder: ((ctx, index) => Dismissible(
          direction: DismissDirection.endToStart,
          resizeDuration: Duration(milliseconds: 100),
          background: Container(
              padding: EdgeInsets.fromLTRB(330, 0, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorScheme.error),
              margin: const EdgeInsets.all(3),
              child: Icon(
                Icons.delete,
              )),
          onDismissed: (direction) {
            removeList(expenseData[index]);
          },
          key: ValueKey(expenseData[index]),
          child: ExpenseItem(expenseData[index]))),
    );
  }
}
