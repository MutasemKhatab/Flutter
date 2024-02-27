import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNotifier extends ChangeNotifier {
  PageNotifier() : super();
  int page = 3;

  void changePage(int index) {
    page = index;
    notifyListeners();
  }
}

final pageProvider = ChangeNotifierProvider((ref) {
  return PageNotifier();
});
