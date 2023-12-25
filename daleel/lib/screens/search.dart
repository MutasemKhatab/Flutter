import 'package:daleel/models/description.dart';
import 'package:daleel/providers/info_provider.dart';
import 'package:daleel/screens/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Search extends ConsumerStatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  final searchController = TextEditingController();
  List<Description> results = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'بحث',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 0, 124, 245))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        results = [];
                      });
                      final info = ref.watch(infoProvider.notifier).infoList;
                      results.addAll(info
                          .where((element) => element.name.contains(value)));
                      setState(() {
                        results = results;
                      });
                    },
                    controller: searchController,
                    onTapOutside: (event) =>
                        FocusScope.of(context).requestFocus(FocusNode()),
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'ابحث هنا',
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.search),
              ],
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? Center(
                    child: Text(
                    "لا يوجد نتائج",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DescriptionScreen(description: results[index]),
                          ));
                        },
                        subtitle: Text(
                          results[index].category!,
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        title: Text(
                          results[index].name,
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    },
                    itemCount: results.length,
                  ),
          )
        ],
      ),
    );
  }
}
