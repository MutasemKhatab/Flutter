import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const categoryIcons = {
  Category.work: Icons.work,
  Category.food: Icons.dining,
  Category.leisuer: Icons.movie,
  Category.travel: Icons.flight_takeoff_outlined
};

class Expense {
  Expense(this.title, this.amount, this.date, this.category) : id = uuid.v4();
  final DateTime date;
  final String title;
  final double amount;
  Category category;
  final String id;

  String get formattedDate {
    return formater.format(date);
  }

  static double getCategoryPercentage(Category c) {
    double totalAmount = 0;
    double categoryAmount = 0;
    for (var element in expenseData) {
      totalAmount += element.amount;
      if (element.category == c) {
        categoryAmount += element.amount;
      }
    }
    if (totalAmount != 0) {
      return categoryAmount / totalAmount;
    } else {
      return 0;
    }
  }
}

enum Category { food, travel, leisuer, work }

const uuid = Uuid();
final formater = DateFormat.yMMMd();

/// Expenses List
List<Expense> expenseData = [];
