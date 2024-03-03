import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade_guru/models/suggest.dart';

import '../helpers/dio_factory.dart';
import '../models/notification_model.dart';

class SuggestionProviderNotifier extends StateNotifier<List<Suggest>> {
  SuggestionProviderNotifier() : super([]);
  late List<Suggest> closedSuggestions;
  Future<void> addSuggestion(Suggest suggest) async {
    try {
      final fs = FirebaseFirestore.instance;
      final doc = await fs.collection('suggestions').add({});
      await doc.set(suggest.toMap(doc.id));
      await sendNotification(
        NotificationModel(
          title: 'TRADE GURU',
          body: 'قمنا بأضافه توصية جديدة. سارع لتطبيقها بسرعة !!!!',
        ),
      );
      state = [suggest.copyWith(id: doc.id), ...state];
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> getSuggestions() async {
    final user = FirebaseAuth.instance.currentUser;
    final fs = FirebaseFirestore.instance;
    final userData = await fs.collection('users').doc(user!.uid).get();
    if (DateTime.parse(userData.data()!['endSubscription'])
        .isBefore(DateTime.now())) {
      fetchClosedSuggestions();
      return false;
    }
    if (state.isNotEmpty) {
      return state;
    }
    return await fetchSuggestions();
  }

  void fetchClosedSuggestions() {
    final List<Suggest> suggestions = [];
    final fs = FirebaseFirestore.instance;
    fs
        .collection('suggestions')
        .where('type', isEqualTo: 'Closed')
        .get()
        .then((value) {
      for (var doc in value.docs) {
        try {
          suggestions.add(Suggest.fromMap(doc.data(), doc.id));
        } finally {}
      }
      closedSuggestions = suggestions;
    });
  }

  void moveSuggestion(Suggest suggest, String to, {String points = '0'}) async {
    final fs = FirebaseFirestore.instance;
    final doc = fs.collection('suggestions').doc(suggest.id);
    await doc.update({
      'type': to,
      'points': points,
      'date': DateTime.now().toIso8601String()
    });
    if (to == 'Closed') {
      await sendNotification(
        NotificationModel(
          title: 'TRADE GURU',
          body: 'قمنا بأغلاق الصفقة (${suggest.currency})\nاغلقها بسرعة !!!',
        ),
      );
    }
    if (to == 'Processing') {
      await sendNotification(
        NotificationModel(
          title: 'TRADE GURU',
          body: 'تم تفعيل الصفقة (${suggest.currency}) ',
        ),
      );
    }
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

  Future<void> sendNotification(NotificationModel model) async {
    final Dio dio = DioFactory().getDio();
    try {
      await dio.post(
        "https://fcm.googleapis.com/fcm/send",
        data: {
          "to": "/topics/notification",
          "priority": "high",
          "notification": {
            "title": model.title,
            "body": model.body,
            "sound": 'notification.aiff',
            "android_channel_id": "notification_id"
          },
          "android": {
            "priority": "HIGH",
            "notification": {
              "notification_priority": "PRIORITY_MAX",
              "sound": "notification",
              "default_vibrate_timings": true,
              "default_light_settings": true
            }
          },
          "data": {
            "type": "order",
            "id": "87",
            "click_action": "FLUTTER_NOTIFICATION_CLICK"
          }
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }
}

final suggestionProvider =
    StateNotifierProvider<SuggestionProviderNotifier, List<Suggest>>(
        (ref) => SuggestionProviderNotifier());
