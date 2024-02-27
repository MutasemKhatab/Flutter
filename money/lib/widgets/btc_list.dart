import 'package:flutter/material.dart';
import 'package:money/models/btc_market_cap.dart';

class BTCList extends StatefulWidget {
  const BTCList({super.key, required this.list});
  final List<BtcMarketCap> list;
  @override
  State<BTCList> createState() => _BTCListState();
}

class _BTCListState extends State<BTCList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: widget.list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(right: 10),
          width: 150,
          child: ListTile(
            title: Row(
              children: [
                Text(
                  widget.list[index].title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.list[index].change,
                  style: TextStyle(
                    color: widget.list[index].change.contains('-')
                        ? Colors.red
                        : Colors.green,
                    fontSize: 10,
                  ),
                )
              ],
            ),
            dense: true,
            subtitle: Text(widget.list[index].number,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }
}
