import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money/models/btc_market_cap.dart';
import 'package:money/models/btc_martket_cap.dart';
import 'package:money/models/spot_m.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final TextEditingController _btcMarketCapTitleController =
      TextEditingController();
  final TextEditingController _btcMarketCapNumberController =
      TextEditingController();
  final TextEditingController _btcMarketCapChangeController =
      TextEditingController();

  final TextEditingController _btcMartketCapBtcPriceController =
      TextEditingController();
  final TextEditingController _btcMartketCapBtcMarketCapController =
      TextEditingController();
  final TextEditingController _btcMartketCapBtcTotalVolumeController =
      TextEditingController();
  final TextEditingController _btcMartketCapBtcChangePercentageController =
      TextEditingController();

  final TextEditingController _spotsTitleController = TextEditingController();
  final TextEditingController _spotsDateController = TextEditingController();
  final TextEditingController _spotsCurrentPriceController =
      TextEditingController();
  final TextEditingController _spotsChangeController = TextEditingController();
  final TextEditingController _spotsBuyController = TextEditingController();
  final TextEditingController _spotsCapitalController = TextEditingController();
  final TextEditingController _spotsStopLossController =
      TextEditingController();

  final TextEditingController _targetsNumberController =
      TextEditingController();
  final TextEditingController _targetsChangeController =
      TextEditingController();

  final List<Target> _targets = [];

  String _iconURL = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const Text(
              'BTC Market Cap',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _btcMarketCapTitleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _btcMarketCapNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _btcMarketCapChangeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Change',
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: _handelBTCMarketCapSubmit,
                    icon: const Icon(Icons.save, color: Colors.white),
                    label: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'BTC Martket Cap',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _btcMartketCapBtcPriceController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Btc Price',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _btcMartketCapBtcMarketCapController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Btc Market Cap',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _btcMartketCapBtcTotalVolumeController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Btc Total Volume',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller:
                              _btcMartketCapBtcChangePercentageController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Btc Change Percentage',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: _handelBTCMartketCapSubmit,
                    icon: const Icon(Icons.save, color: Colors.white),
                    label: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Spots',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _spotsTitleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _spotsDateController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _spotsCurrentPriceController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Current Price',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _spotsChangeController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Change',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _spotsBuyController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Buy',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _spotsCapitalController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Capital',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _spotsStopLossController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Stop Loss',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Targets'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _targetsNumberController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _targetsChangeController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Change',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: _handelTargetsSubmit,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Text(
                          '${_targets[index].number} ${_targets[index].change} -- '),
                      scrollDirection: Axis.horizontal,
                      itemCount: _targets.length,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FilledButton.icon(
                    onPressed: _handelImageSubmit,
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text(
                      'Choose Image',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: _handelSpotsSubmit,
                    icon: const Icon(Icons.save, color: Colors.white),
                    label: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _handelBTCMarketCapSubmit() {
    final title = _btcMarketCapTitleController.text;
    final number = _btcMarketCapNumberController.text;
    final change = _btcMarketCapChangeController.text;

    final btcMarketCap = BtcMarketCap(
      title: title,
      number: number,
      change: change,
    );

    FirebaseFirestore.instance
        .collection('btcMartketCap')
        .add(btcMarketCap.toJson());
  }

  void _handelBTCMartketCapSubmit() {
    final btcPrice = _btcMartketCapBtcPriceController.text;
    final btcMarketCap = _btcMartketCapBtcMarketCapController.text;
    final btcTotalVolume = _btcMartketCapBtcTotalVolumeController.text;
    final btcChangePercentage =
        _btcMartketCapBtcChangePercentageController.text;

    final btcMartketCap = BtcMartketCap(
      btcPrice: btcPrice,
      btcMarketCap: btcMarketCap,
      btcTotalVolume: btcTotalVolume,
      btcChangePercentage: btcChangePercentage,
    );

    FirebaseFirestore.instance
        .collection('btcMarketCap')
        .doc('main')
        .set(btcMartketCap.toJson());
  }

  void _handelTargetsSubmit() {
    final number = _targetsNumberController.text;
    final change = _targetsChangeController.text;

    final target = Target(
      number: number,
      change: change,
    );
    setState(() {
      _targets.add(target);
      _targetsNumberController.clear();
      _targetsChangeController.clear();
    });
  }

  Future<void> _handelSpotsSubmit() async {
    final title = _spotsTitleController.text;
    final date = _spotsDateController.text;
    final currentPrice = _spotsCurrentPriceController.text;
    final change = _spotsChangeController.text;
    final buy = _spotsBuyController.text;
    final capital = _spotsCapitalController.text;
    final stopLoss = _spotsStopLossController.text;

    final spot = SpotM(
      id: '',
      title: title,
      date: date,
      currentPrice: currentPrice,
      change: change,
      buy: buy,
      capital: capital,
      stopLoss: stopLoss,
      icon: _iconURL,
      targets: _targets,
    );
    final doc = await FirebaseFirestore.instance.collection('spots').add({});
    final id = doc.id;
    spot.id = id;
    await doc.set(spot.toJson());
  }

  void _handelImageSubmit() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final File file = File(image.path);
    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final TaskSnapshot uploadTask = await storageRef.putFile(file);
    final String imageURL = await uploadTask.ref.getDownloadURL();
    setState(() {
      _iconURL = imageURL;
    });
  }
}
