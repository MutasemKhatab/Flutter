import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade_guru/providers/suggestions_provider.dart';
import 'package:trade_guru/widgets/suggestion_tile.dart';

class SuggestionsList extends ConsumerStatefulWidget {
  const SuggestionsList({required this.type, super.key});
  final String type;
  @override
  ConsumerState<SuggestionsList> createState() => _SuggestionsListState();
}

class _SuggestionsListState extends ConsumerState<SuggestionsList> {
  bool firstTime = true;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).colorScheme.secondary,
      onRefresh: () async {
        await ref.watch(suggestionProvider.notifier).fetchSuggestions();
        setState(() {
          firstTime = false;
        });
      },
      child: FutureBuilder(
          future: ref.watch(suggestionProvider.notifier).getSuggestions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                firstTime) {
              return Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ));
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text(snapshot.error.toString(),
                      style: const TextStyle(color: Colors.white)));
            }
            final list = snapshot.data!
                .where((element) => element.type == widget.type)
                .toList();
            if (list.isEmpty) {
              return ListView(children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                const Center(
                    child: Text('No Suggestions Yet\nSwipe Down to Refresh',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
              ]);
            }
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SuggestionTile(suggest: list[index]);
              },
            );
          }),
    );
  }
}
