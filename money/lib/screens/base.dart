import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money/provider/page_provider.dart';
import 'package:money/screens/home.dart';
import 'package:money/screens/profile.dart';
import 'package:money/screens/setting.dart';
import 'package:money/screens/spots.dart';
import 'package:money/widgets/bottom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Base extends ConsumerStatefulWidget {
  const Base({super.key});

  @override
  ConsumerState<Base> createState() => _BaseState();
}

class _BaseState extends ConsumerState<Base>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 3);
    ref.read(pageProvider).addListener(() {
      _tabController.animateTo(ref.read(pageProvider).page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ref.watch(pageProvider).page != 3
            ? null
            : AppBar(
                surfaceTintColor: Colors.white,
                title: const Text('Goldenmilioon'),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.person, size: 30, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Profile();
                    }));
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    padding: const EdgeInsets.all(0),
                    shadowColor: Colors.black,
                    elevation: 3,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications,
                        size: 35, color: Colors.black),
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      padding: const EdgeInsets.all(0),
                      shadowColor: Colors.black,
                      elevation: 3,
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: const BottomAppbar(),
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Setting(),
            const Spots(),
            Center(
              child: FilledButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse(
                      'https://youtu.be/p7igZnSVKlY?si=nCqEGdIBmfMDlLC5',
                    ),
                  );
                },
                child: const Text('Youtube'),
              ),
            ),
            const Home(),
          ],
        ));
  }
}
