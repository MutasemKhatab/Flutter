import 'package:daleel/providers/info_provider.dart';
import 'package:daleel/screens/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen(
      {required this.list,
      required this.title,
      this.anotherList = true,
      Key? key})
      : super(key: key);
  final List list;
  final bool anotherList;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () async {
            final newSubList = ref
                .watch(infoProvider.notifier)
                .infoList
                .where((element) => element.category == list[index])
                .toList();
            final newList = <String>[];
            for (var element in newSubList) {
              newList.add(element.name);
            }
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => anotherList
                  ? ListScreen(
                      list: newList,
                      title: list[index],
                      anotherList: false,
                    )
                  : DescriptionScreen(
                      description: ref
                          .watch(infoProvider.notifier)
                          .infoList
                          .where((element) => element.name == list[index])
                          .first),
            ));
          },
          title: Text(
            list[index],
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        itemCount: list.length,
      ),
    );
  }
}
