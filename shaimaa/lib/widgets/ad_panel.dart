import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdPanel extends StatefulWidget {
  const AdPanel({super.key});

  @override
  State<AdPanel> createState() => _AdPanelState();
}

class _AdPanelState extends State<AdPanel> {
  Widget content = const SizedBox();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchAdData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('لا يوجد اعلان');
        } else {
          return Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).primaryColorDark, width: 2),
                  color: Theme.of(context).primaryColorLight.withAlpha(100)),
              child: SingleChildScrollView(child: content),
            ),
          );
        }
      },
    );
  }

  Future<void> _fetchAdData() async {
    final data = await FirebaseFirestore.instance.collection('ad').get();
    if (data.docs.first.data()['type'] == 'text') {
      content = Text(
        data.docs.first.data()['content'],
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        overflow: TextOverflow.fade,
        style: const TextStyle(fontSize: 20),
      );
    } else {
      content = Image.network(data.docs.first.data()['content']);
    }
  }
}
