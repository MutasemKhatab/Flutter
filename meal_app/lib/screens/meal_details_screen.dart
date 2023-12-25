import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/provider/fav_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen(this._meal, {Key? key}) : super(key: key);
  final Meal _meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = ref.watch(favoriteMeals);
    final isFavorite = meals.contains(_meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded =
                    ref.read(favoriteMeals.notifier).toggleMealFavorate(_meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text(wasAdded ? 'Meal added as Fav' : 'Meal removed')));
              },
              icon: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                duration: const Duration(milliseconds: 100),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: _meal.id,
              child: Image.network(
                _meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 14),
            for (final ingredient in _meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 14),
            for (final step in _meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
