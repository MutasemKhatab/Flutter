import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade_guru/models/suggest.dart';

class SuggestionProviderNotifier extends StateNotifier<List<Suggest>> {
  SuggestionProviderNotifier() : super([]);

  Future<void> addSuggestion(Suggest suggest) async {
    final fs = FirebaseFirestore.instance;
    final doc = await fs.collection('suggestions').add({});
    doc.set(suggest.toMap(doc.id));
    state = [suggest.copyWith(id: doc.id), ...state];
  }

  Future<List<Suggest>> getSuggestions() async {
    if (state.isNotEmpty) {
      return state;
    }
    return await fetchSuggestions();
  }

  void moveSuggestion(Suggest suggest, String to, {String points = '0'}) async {
    final fs = FirebaseFirestore.instance;
    final doc = fs.collection('suggestions').doc(suggest.id);
    await doc.update({
      'type': to,
      'points': points,
      'date': DateTime.now().toIso8601String()
    });
    final newSuggest =
        suggest.copyWith(type: to, points: points, date: DateTime.now());
    state.removeWhere((element) => newSuggest.id == element.id);
    state = [
      ...state,
      newSuggest,
    ];
  }

  Future<List<Suggest>> fetchSuggestions() async {
    final List<Suggest> suggestions = [];
    final fs = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await fs.collection('suggestions').get();
    for (var doc in querySnapshot.docs) {
      try {
        suggestions.add(Suggest.fromMap(doc.data(), doc.id));
      } finally {}
    }
    // sort the suggestions by the date
    suggestions.sort((a, b) => b.date.compareTo(a.date));
    state = suggestions;
    return suggestions;
  }
}

final suggestionProvider =
    StateNotifierProvider<SuggestionProviderNotifier, List<Suggest>>(
        (ref) => SuggestionProviderNotifier());
