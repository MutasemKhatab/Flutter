import 'package:flutter/material.dart';
import 'package:trade_guru/models/suggest.dart';
import 'package:trade_guru/widgets/tp_tile.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({required this.suggest, Key? key}) : super(key: key);

  final Suggest suggest;
  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        body: Container(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.suggest.currency,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Text(
                    widget.suggest.isBuy ? "Buy" : "Sell",
                    style: TextStyle(
                      color: widget.suggest.isBuy ? Colors.green : Colors.red,
                      fontSize: 12,
                      backgroundColor: widget.suggest.isBuy
                          ? Colors.green.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.suggest.currency,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.suggest.fromTo,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "SL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.suggest.sl,
                  style: TextStyle(
                    color: Colors.red,
                    backgroundColor: Colors.red.withOpacity(0.2),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.suggest.tpList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  itemBuilder: (context, index) =>
                      TpTile(index: index, tp: widget.suggest.tpList[index])),
            ),
          ]),
        ),
      ),
    );
  }
}
