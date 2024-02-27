import 'package:flutter/material.dart';

class Step extends StatefulWidget {
  const Step(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});
  final String title;
  final String subtitle;
  final String icon;

  @override
  State<Step> createState() => _StepState();
}

class _StepState extends State<Step> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(widget.icon, style: const TextStyle(fontSize: 25)),
              const SizedBox(width: 10),
              Text(widget.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
            ],
          ),
          AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: Text(
                widget.subtitle,
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 100),
              firstCurve: Curves.easeIn,
              secondCurve: Curves.easeIn,
              sizeCurve: Curves.easeIn,
              reverseDuration: const Duration(milliseconds: 100)),
        ],
      ),
    );
  }
}
