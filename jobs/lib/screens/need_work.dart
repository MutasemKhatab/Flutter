import 'package:flutter/material.dart';
import 'package:jobs/widgets/new_design.dart';

class NeedWork extends StatefulWidget {
  const NeedWork({super.key});

  @override
  State<NeedWork> createState() => _NeedWorkState();
}

class _NeedWorkState extends State<NeedWork>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انا أريد:'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TabBar(controller: _tabController, tabs: const [
            Tab(text: 'تصميم جديد'),
            Tab(text: 'لدي تصميم وأريد تنفيذه'),
          ]),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                NewDesign(),
                Text('لدي تصميم وأريد تنفيذه'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
