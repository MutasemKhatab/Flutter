import 'package:flutter/material.dart';
import 'package:trade_guru/widgets/custom_drawer.dart';
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
    _tabController = TabController(length: 3, vsync: this);
    Future.delayed(
      Duration.zero,
      () async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text(
            'Open an account with us to improve your trading experience with NAGA TRADE and enter the prize draw',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          content:
              Image.asset('assets/images/naga.png', height: 300, width: 300),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Later',
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  launchUrl(Uri.parse(
                      'https://www.naga.com/register?cmp=8o7n1w5s&refid=3211'));
                },
                child: const Text(
                  'Open Account',
                  style: TextStyle(color: Colors.white),
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
                  // GestureDetector(
                  //   onTap: () =>
                  // child:
                  const Text(
                    "Trade Guru",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  // ),
                  const Spacer(),
                  //dawer button
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
            Container(
              alignment: Alignment.center,
              color: const Color(0xFF131723),
              child: FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    String? type;
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => StatefulBuilder(
                              builder: (context, setState) => ColoredBox(
                                color: const Color(0xFF131723),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Subscribe Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Get access to all the suggestions',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                    .withOpacity(0.5),
                                                width: 1,
                                              ),
                                            ),
                                            child: RadioListTile(
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xFF3A6FF8)),
                                              value: '1',
                                              onChanged: (value) {
                                                setState(() {
                                                  type = '1';
                                                });
                                              },
                                              contentPadding: EdgeInsets.zero,
                                              groupValue: type,
                                              title: const Column(
                                                children: [
                                                  Text(
                                                    '1 Month',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    '50 JOD',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                                  .withOpacity(0.5),
                                              width: 1,
                                            ),
                                          ),
                                          child: RadioListTile(
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    const Color(0xFF3A6FF8)),
                                            value: '2',
                                            onChanged: (value) {
                                              setState(() {
                                                type = '2';
                                              });
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            groupValue: type,
                                            title: const Column(
                                              children: [
                                                Text(
                                                  '3 Months',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  '100 JOD',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                    .withOpacity(0.5),
                                                width: 1,
                                              ),
                                            ),
                                            child: RadioListTile(
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xFF3A6FF8)),
                                              value: '3',
                                              onChanged: (value) {
                                                setState(() {
                                                  type = '3';
                                                });
                                              },
                                              contentPadding: EdgeInsets.zero,
                                              groupValue: type,
                                              title: const Column(
                                                children: [
                                                  Text(
                                                    textAlign: TextAlign.center,
                                                    '12 Months',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    '250 JOD',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    //pay now button
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FilledButton(
                                          style: FilledButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                          onPressed: () async {},
                                          child: const Text(
                                            'VISA',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        FilledButton(
                                          style: FilledButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                          onPressed: () async {},
                                          child: const Text(
                                            'USDT',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: const Text(
                    'Subscribe Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            ColoredBox(
              color: const Color(0xFF131723),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.white.withOpacity(0.2),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Theme.of(context).colorScheme.secondary,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(
                    text: "Active",
                  ),
                  Tab(
                    text: "Processing",
                  ),
                  Tab(
                    text: "Closed",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
