import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
    this._category,this.availableMeals, {
    Key? key,
  }) : super(key: key);
  final List<Meal> availableMeals;

  final Category _category;
  void _selectCategory(BuildContext context) {
    var meals = availableMeals
        .where((element) => element.categories.contains(_category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
              body:
                  MealScreen(meals,  title: _category.title)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            _category.color.withOpacity(0.55),
            _category.color.withOpacity(0.9),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          _category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
