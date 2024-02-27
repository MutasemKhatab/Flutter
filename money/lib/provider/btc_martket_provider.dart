import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money/models/btc_market_cap.dart';

class BTCMarketNotifier extends StateNotifier<List<BtcMarketCap>> {
  BTCMarketNotifier() : super([]);

  Future<List<BtcMarketCap>> fetchBTCMarketCap() async {
    final fs = FirebaseFirestore.instance;
    final data = await fs.collection('btcMartketCap').get();
    final btcMarketCap =
        data.docs.map((e) => BtcMarketCap.fromJson(e.data())).toList();
    state = btcMarketCap;
    return btcMarketCap;
  }

  Future<List<BtcMarketCap>> getBTCMarketCap() async {
    if (state.isEmpty) {
      return fetchBTCMarketCap();
    }
    return state;
  }

  List<BtcMarketCap> get btcMarketCap => state;
}

final btcMarketProvider =
    StateNotifierProvider<BTCMarketNotifier, List<BtcMarketCap>>(
  (ref) => BTCMarketNotifier(),
);
