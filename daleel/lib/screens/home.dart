import 'dart:collection';

import 'package:daleel/providers/info_provider.dart';
import 'package:daleel/screens/list_screen.dart';
import 'package:daleel/screens/search.dart';
import 'package:daleel/widgets/ad_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late Map<String, List<String>> _info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: ref.watch(infoProvider.notifier).getInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('...الرجاء الاتصال بالإنترنت'),
                );
              }
              _info = ref.watch(infoProvider.notifier).getState();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  const SizedBox(height: 75),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              if (snapshot.data!['1'] == null) {
                                return Scaffold(
                                    appBar: AppBar(),
                                    body: const Center(
                                      child: Text('لا توجد معلومات'),
                                    ));
                              }
                              final HashSet set = HashSet();
                              for (var element in snapshot.data!['1']!) {
                                set.add(element);
                              }
                              return ListScreen(
                                  list: set.toList(), title: 'القطاع العام');
                            }));
                          },
                          child: Image.asset('assets/icons/gov.png',
                              width: 150, height: 150)),
                      const Spacer(),
                      GestureDetector(
                          onTap: () async {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              if (snapshot.data!['2'] == null) {
                                return Scaffold(
                                    appBar: AppBar(),
                                    body: const Center(
                                      child: Text('لا توجد معلومات'),
                                    ));
                              }
                              final HashSet set = HashSet();
                              for (var element in snapshot.data!['2']!) {
                                set.add(element);
                              }
                              return ListScreen(
                                  list: set.toList(), title: 'القطاع الخاص');
                            }));
                          },
                          child: Image.asset('assets/icons/market.png',
                              width: 150, height: 150)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Search(),
                            ));
                          },
                          child: Image.asset('assets/icons/search.png',
                              width: 150, height: 150)),
                      const Spacer(),
                      GestureDetector(
                          onTap: () async {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              if (snapshot.data!['3'] == null) {
                                return Scaffold(
                                    appBar: AppBar(),
                                    body: const Center(
                                      child: Text('لا توجد معلومات'),
                                    ));
                              }

                              return ListScreen(
                                list: snapshot.data!['3']!,
                                title: 'الطورائ',
                                anotherList: false,
                              );
                            }));
                          },
                          child: Image.asset('assets/icons/eme.png',
                              width: 150, height: 150)),
                    ],
                  ),
                  Expanded(
                      child: Center(
                    child: GestureDetector(
                        onTap: () => launchUrl(Uri.parse(
                            'https://api.whatsapp.com/send?phone=966534220200')),
                        child: Image.asset(
                          'assets/icons/contactus.png',
                          width: 100,
                          height: 100,
                        )),
                  )),
                  const AdPanel(),
                ]),
              );
            }));
  }
}
