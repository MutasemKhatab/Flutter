import 'package:carousel_slider/carousel_slider.dart';
import 'package:daleel/models/ad.dart';
import 'package:daleel/providers/info_provider.dart';
import 'package:daleel/screens/ad_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdPanel extends ConsumerStatefulWidget {
  const AdPanel({Key? key}) : super(key: key);

  @override
  ConsumerState<AdPanel> createState() => _AdPanelState();
}

class _AdPanelState extends ConsumerState<AdPanel> {
  List<Ad> adsList = [];
  int imageIndex = 0;
  final carController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.watch(infoProvider.notifier).getAds(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          adsList = ref.watch(infoProvider.notifier).adsList;
          final images = adsList
              .map((e) => Image.network(
                    e.icon,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ))
              .toList();
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AdScreen(ad: adsList[imageIndex]),
                  ),
                );
              },
              child: CarouselSlider(
                items: images,
                carouselController: carController,
                disableGesture: false,
                options: CarouselOptions(
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) => imageIndex = index,
                    enableInfiniteScroll: true,
                    autoPlay: true),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
