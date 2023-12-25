
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(children: [
        SwitchListTile(
          value: filters[Filter.glutenFree]!,
          onChanged: (value) {
            ref
                .watch(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, value);
          },
          title: Text(
            'Gluten-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text('Only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(right: 22, left: 34),
        ),
        SwitchListTile(
          value: filters[Filter.lactoseFree]!,
          onChanged: (value) {
            ref
                .watch(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, value);
          },
          title: Text(
            'Lactose-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text('Only include lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(right: 22, left: 34),
        ),
        SwitchListTile(
          value: filters[Filter.vegetarian]!,
          onChanged: (value) {
            ref
                .watch(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, value);
          },
          title: Text(
            'Vegetarian',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text('Only include vegetarian meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(right: 22, left: 34),
        ),
        SwitchListTile(
          value: filters[Filter.vegan]!,
          onChanged: (value) {
            ref.watch(filtersProvider.notifier).setFilter(Filter.vegan, value);
          },
          title: Text(
            'Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text('Only include Vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(right: 22, left: 34),
        )
      ]),
    );
  }
}
