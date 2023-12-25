import 'dart:io';

import 'package:daleel/models/description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({required this.description, Key? key})
      : super(key: key);
  final Description description;
  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.description.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  if (widget.description.phones != null &&
                      widget.description.descs != null)
                    for (var i = 0; i < widget.description.phones!.length; i++)
                      GestureDetector(
                        onTap: () {
                          final content = Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.description.phones![i],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.right),
                              Text(": ${widget.description.descs![i]}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.right),
                            ],
                          );
                          final actions = [
                            TextButton(
                                onPressed: () => Share.share(
                                    '${widget.description.name}\n${widget.description.phones![i]}'),
                                child: Text(
                                  'مشاركة',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )),
                            TextButton(
                                onPressed: () => launchUrl(Uri.parse(
                                    'tel:${widget.description.phones![i]}')),
                                child: Text(
                                  'اتصال',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )),
                            if (widget.description.coords != null &&
                                widget.description.coords!.isNotEmpty)
                              for (var i = 0;
                                  i < widget.description.coords!.length;
                                  i++)
                                TextButton(
                                    onPressed: () async {
                                      if (await canLaunchUrl(Uri.parse(
                                          'https://www.google.com/maps/search/?api=1&query=${widget.description.coords![i]}'))) {
                                        launchUrl(Uri.parse(
                                            'https://www.google.com/maps/search/?api=1&query=${widget.description.coords![i]}'));
                                      } else {
                                        launchUrl(Uri.parse(
                                            "https://maps.apple.com/maps?q=${widget.description.coords![i]}"));
                                      }
                                    },
                                    child: Text('الذهاب الى الموقع',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        textAlign: TextAlign.right))
                          ];
                          Platform.isIOS
                              ? showCupertinoDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) => CupertinoAlertDialog(
                                        content: content,
                                        actions: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [...actions],
                                              ),
                                            ],
                                          )
                                        ],
                                      ))
                              : showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        alignment: Alignment.center,
                                        actions: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [...actions],
                                              ),
                                            ],
                                          )
                                        ],
                                        content: content,
                                      ));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.description.phones![i],
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.right),
                            Text(": ${widget.description.descs![i]}",
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.right),
                          ],
                        ),
                      ),
                ])),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
          ]),
    );
  }
}
