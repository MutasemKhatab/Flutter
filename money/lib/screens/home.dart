import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money/models/btc_market_cap.dart';
import 'package:money/models/btc_martket_cap.dart';
import 'package:money/provider/btc_market_provider.dart';
import 'package:money/provider/btc_martket_provider.dart';
import 'package:money/widgets/btc_box.dart';
import 'package:money/widgets/btc_list.dart';
import 'package:money/widgets/contacts.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  BtcMartketCap? btcMarketCap;
  List<BtcMarketCap> btcMartketCapList = [];
  Future<Object?>? theFuture() async {
    btcMarketCap =
        await ref.watch(btcMartketProvider.notifier).getBTCMartketCap();
    btcMartketCapList =
        await ref.watch(btcMarketProvider.notifier).getBTCMarketCap();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: theFuture(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Contacts(
                  title: 'Join Our Telegram Channel',
                  image: 'assets/images/telegram.png',
                  onTap: () => launchUrl(
                    Uri.parse('https://t.me/goldenmilion'),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(
                      Icons.arrow_outward_sharp,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Text('BTC Martket Cap',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                BTCList(list: btcMartketCapList),
                const SizedBox(height: 20),
                Contacts(
                  title: 'Crypto News',
                  onTap: () => launchUrl(
                    Uri.parse('https://coinmarketcap.com/'),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(
                      Icons.arrow_outward_sharp,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Text('BTC Market Cap',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    BTCBox(
                      title: 'BTC Price',
                      subtitle: btcMarketCap!.btcPrice,
                    ),
                    const SizedBox(width: 20),
                    BTCBox(
                      title: 'BTC Change 24h',
                      subtitle: btcMarketCap!.btcChangePercentage,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    BTCBox(
                      title: 'BTC Market Cap',
                      subtitle: btcMarketCap!.btcMarketCap,
                    ),
                    const SizedBox(width: 20),
                    BTCBox(
                      title: 'BTC Total Volume',
                      subtitle: btcMarketCap!.btcTotalVolume,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
