//create a spot StateNotifier

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money/models/spot_m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpotNotifier extends StateNotifier<List<SpotM>> {
  SpotNotifier() : super([]);

  Future<List<SpotM>> fetchSpots() async {
    final fs = FirebaseFirestore.instance;
    final data = await fs.collection('spots').get();
    final spots = data.docs.map((e) => SpotM.fromJson(e.data())).toList();
    state = spots;
    return spots;
  }

  Future<List<SpotM>> getSpots() async {
    if (state.isEmpty) {
      return fetchSpots();
    }
    return state;
  }

  List<SpotM> get spots => state;
}

final spotProvider = StateNotifierProvider<SpotNotifier, List<SpotM>>(
  (ref) => SpotNotifier(),
);
