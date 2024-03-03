import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade_guru/helpers/lang.dart';
import 'package:trade_guru/main.dart';
import 'package:trade_guru/models/suggest.dart';
import 'package:trade_guru/providers/suggestions_provider.dart';
import 'package:trade_guru/screens/suggestion_screen.dart';

class SuggestionTile extends ConsumerWidget {
  const SuggestionTile({required this.suggest, super.key});
  final Suggest suggest;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTapDown: (details) {
        // ! YOU HAVE TO USE THE ONTAPDOWN GESTURE DETECTOR
        // ! TO GET THE POSITION OF THE TAP
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SuggestionScreen(suggest: suggest),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              //offsets for the scale animation
              const begin = 0.0;
              const end = 1.0;

              //curve for the scale animation
              final scaleTween = Tween(begin: begin, end: end).chain(
                CurveTween(curve: Curves.easeInOut),
              );

              //getting the device width and height
              final width = MediaQuery.of(context).size.width;
              final height = MediaQuery.of(context).size.height;

              //getting the position of the tap then devide it by
              //the width and height on 2
              //because the zero offset is the center of the screen
              double posX = details.globalPosition.dx - width / 2;
              double posY = details.globalPosition.dy - height / 2;
              final x = (posX / (width / 2)) / 2;
              final y = (posY / (height / 2) / 2);

              //curve for the slide animation
              final slideTween =
                  Tween(begin: Offset(x, y), end: Offset.zero).chain(
                CurveTween(curve: Curves.easeInOut),
              );

              // return the slide transition with the scale transition
              return SlideTransition(
                position: animation.drive(slideTween),
                child: ScaleTransition(
                  scale: animation.drive(scaleTween),
                  child: child,
                ),
              );
            },
            transitionDuration: const Duration(milliseconds: 200),
            reverseTransitionDuration: const Duration(milliseconds: 200),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF131723),
          border: Border(
            bottom: BorderSide(color: Colors.white.withOpacity(0.15), width: 1),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisSize: MainAxisSize.max, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Text(
                        suggest.isBuy ? Lang.buy : Lang.sell,
                        style: TextStyle(
                          color: suggest.isBuy ? Colors.green : Colors.red,
                          fontSize: 12,
                          backgroundColor: suggest.isBuy
                              ? Colors.green.withOpacity(0.2)
                              : Colors.red.withOpacity(0.2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        suggest.currency,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
                  Text(
                    suggest.fromTo,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (suggest.type == 'Closed') ...[
              // show date
              Text(
                "${suggest.date.day}/${suggest.date.month}/${suggest.date.year}",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${suggest.points} PIPS",
                style: TextStyle(
                    color: suggest.points.contains('-')
                        ? Colors.red
                        : Colors.green,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
            ],
            const SizedBox(width: 10),
            if (isAdmin && suggest.type != 'Closed')
              PopupMenuButton(
                iconColor: Colors.white.withOpacity(0.5),
                color: const Color(0xFF131723),
                itemBuilder: (context) {
                  return [
                    if (suggest.type == 'Active')
                      PopupMenuItem(
                        child: Text(
                          Lang.moveToProcessing,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          ref
                              .read(suggestionProvider.notifier)
                              .moveSuggestion(suggest, 'Processing');
                        },
                      ),
                    PopupMenuItem(
                      child: Text(
                        Lang.moveToClosed,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        String points = '';
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xFF131723),
                              title: Text(
                                Lang.enterThePoints,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              content: TextField(
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Points',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onChanged: (value) {
                                  points = value;
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    Lang.cancel,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(suggestionProvider.notifier)
                                        .moveSuggestion(suggest, 'Closed',
                                            points: points);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    Lang.ok,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ];
                },
              )
          ],
        ),
      ),
    );
  }
}
