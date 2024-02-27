import 'package:flutter/material.dart';
import 'package:money/models/spot_m.dart';

class Spot extends StatefulWidget {
  const Spot({
    super.key,
    required this.spot,
  });
  final SpotM spot;
  @override
  State<Spot> createState() => _SpotState();
}

class _SpotState extends State<Spot> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: Text(
              widget.spot.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Open on ${widget.spot.date}',
              style: const TextStyle(color: Colors.green, fontSize: 12),
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: _isExpanded
                    ? const Icon(Icons.arrow_drop_up_sharp)
                    : const Icon(Icons.arrow_drop_down_sharp)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Current Price',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.spot.currentPrice,
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  widget.spot.change,
                  style: const TextStyle(color: Colors.red, fontSize: 15),
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Buy: ${widget.spot.buy}',
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Capital: ${widget.spot.capital}%',
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TargetsList(widget: widget),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'StopLoss: ${widget.spot.stopLoss}',
                        style: const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200))
        ],
      ),
    );
  }
}

class TargetsList extends StatelessWidget {
  const TargetsList({
    super.key,
    required this.widget,
  });
  final Spot widget;

  @override
  Widget build(BuildContext context) {
    int index = 1;
    return Column(
      children: [
        ...widget.spot.targets.map(
          (e) => Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Target ${index++}',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  e.number,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  e.change,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                const Icon(Icons.check_circle, color: Colors.white)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
