import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money/models/btc_martket_cap.dart';

class BTCMartketNotifier extends StateNotifier<BtcMartketCap> {
  BTCMartketNotifier()
      : super(BtcMartketCap(
            btcChangePercentage: '',
            btcMarketCap: '',
            btcPrice: '',
            btcTotalVolume: ''));

  Future<BtcMartketCap> fetchBTCMartketCap() async {
    final fs = FirebaseFirestore.instance;
    final data = await fs.collection('btcMarketCap').doc('main').get();
    final btcMartketCap = BtcMartketCap.fromJson(data.data()!);
    state = btcMartketCap;
    return btcMartketCap;
  }

  Future<BtcMartketCap> getBTCMartketCap() async {
    if (state.btcPrice == '') {
      return fetchBTCMartketCap();
    }
    return state;
  }

  BtcMartketCap get btcMartketCap => state;
}

final btcMartketProvider =
    StateNotifierProvider<BTCMartketNotifier, BtcMartketCap>(
  (ref) => BTCMartketNotifier(),
);
