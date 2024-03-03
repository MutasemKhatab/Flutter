import 'package:flutter/material.dart';
import 'package:trade_guru/helpers/lang.dart';
import 'package:trade_guru/widgets/custom_drawer.dart';
import 'package:trade_guru/widgets/notes_list.dart';
import 'package:trade_guru/widgets/suggestions_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    Future.delayed(
      Duration.zero,
      () async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            Lang.openAnAccountWithUsToImproveYourTradingExperienceWithNAGATRADEAndEnterThePrizeDraw,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          content:
              Image.asset('assets/images/naga.png', height: 300, width: 300),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  Lang.later,
                  style: const TextStyle(color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  launchUrl(Uri.parse(
                      'https://www.naga.com/register?cmp=8y4s4d2d&refid=3210'));
                },
                child: Text(
                  Lang.openAnAccount,
                  style: const TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        endDrawer: const CustomDrawer(),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 5, top: 10),
              decoration: const BoxDecoration(
                  color: Color(0xFF131723),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(
                children: [
                  const Text(
                    "Trade Guru",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  // ),
                  const Spacer(),
                  Builder(
                    builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        style: IconButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        icon: const Icon(
                          Icons.menu,
                          size: 35,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            )),
        body: Column(
          children: [
            ColoredBox(
              color: const Color(0xFF131723),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.white.withOpacity(0.2),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Theme.of(context).colorScheme.secondary,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    text: Lang.active,
                  ),
                  Tab(
                    text: Lang.prossesing,
                  ),
                  Tab(
                    text: Lang.closed,
                  ),
                  Tab(
                    text: Lang.notes,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  SuggestionsList(type: 'Active'),
                  SuggestionsList(type: 'Processing'),
                  SuggestionsList(type: 'Closed'),
                  NotesList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
