import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kutuby/models/book.dart';

class BookProvider extends StateNotifier<List<Book>> {
  BookProvider() : super([]);

  Map<String, Set<String>> specializations = {};
  Map<String, String> specializationsID = {};
  Map<String, String> categoriesID = {};

  Future<void> fetchData() async {
    await _fetchAllBooks();
    await _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    final categoriesData =
        await FirebaseFirestore.instance.collection('categories').get();
    for (var element in categoriesData.docs) {
      specializations[element.data()['name'].trim()] = {};
      categoriesID[element.data()['name']] = element.id;
    }
    final specializationsData =
        await FirebaseFirestore.instance.collection('specializations').get();
    for (var element in specializationsData.docs) {
      specializations[element.data()['category'].trim()]!
          .add(element.data()['name'].trim());
      specializationsID[element.data()['name']] = element.id;
    }
  }

  Future<List<Book>> _fetchAllBooks() async {
    final booksList = <Book>[];
    final booksData =
        await FirebaseFirestore.instance.collection('books').get();
    for (var element in booksData.docs) {
      final book = Book.fromJSON(element.data());
      book.id = element.id;
      booksList.add(book);
    }
    state = booksList;
    return booksList;
  }

  List<Book> get2Books() {
    if (state.length > 2) {
      return state.sublist(0, 2);
    } else {
      return state;
    }
  }

  List<Book> getAllBooks() {
    return state;
  }
}

final bookProvider = StateNotifierProvider<BookProvider, List<Book>>((ref) {
  return BookProvider();
});
