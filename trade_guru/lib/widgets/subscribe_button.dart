import 'package:flutter/material.dart';
import 'package:trade_guru/helpers/lang.dart';

class SubscribeButton extends StatefulWidget {
  const SubscribeButton({super.key});

  @override
  State<SubscribeButton> createState() => _SubscribeButtonState();
}

class _SubscribeButtonState extends State<SubscribeButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
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
        onPressed: showPaymentDialoge,
        child: Text(
          Lang.subscribeNow,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  void showPaymentDialoge() {
    // ! NOTE for the payment guy:
    // * U have to edit the endSubscription date in the firebase
    // * like this
    // * await FirebaseFirestore.instance
    // *     .collection('users')
    // *     .doc(FirebaseAuth.instance.currentUser!.uid)
    // *     .update({
    // *   'endSubscription':
    // *       DateTime.now().add( Duration(days: 30)).toIso8601String(),
    // * });

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
                    Text(
                      Lang.subscribeNow,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Lang.getAccessToAllTheSuggestions,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              fillColor: MaterialStateProperty.all(
                                  const Color(0xFF3A6FF8)),
                              value: '1',
                              onChanged: (value) {
                                setState(() {
                                  type = '1';
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                              groupValue: type,
                              title: Column(
                                children: [
                                  Text(
                                    Lang.oneMonth,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '10 USD',
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
                            fillColor: MaterialStateProperty.all(
                                const Color(0xFF3A6FF8)),
                            value: '2',
                            onChanged: (value) {
                              setState(() {
                                type = '2';
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                            groupValue: type,
                            title: Column(
                              children: [
                                Text(
                                  Lang.threeMonths,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  '20 USD',
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
                              fillColor: MaterialStateProperty.all(
                                  const Color(0xFF3A6FF8)),
                              value: '3',
                              onChanged: (value) {
                                setState(() {
                                  type = '3';
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                              groupValue: type,
                              title: Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    Lang.oneYear,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '50 \nUSD',
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
                    FilledButton(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () async {},
                      child: Text(
                        Lang.payNow,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ));
  }
}
