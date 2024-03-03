import 'dart:ui';

import 'package:bike/widgets/background.dart';
import 'package:bike/widgets/bottom_nav_bar.dart';
import 'package:bike/widgets/item.dart';
import 'package:bike/widgets/main_ad.dart';
import 'package:bike/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Bike'),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 20),
            child: MyIconButton(
              onTap: () {},
              firstColor: Theme.of(context).colorScheme.primary,
              secondColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const MainAd(),
                const SizedBox(width: double.infinity, height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: 10,
                              child: MyIconButton(
                                  onTap: () {},
                                  firstColor: const Color(0xFF363E50),
                                  secondColor: const Color(0xFF181D26),
                                  child: const Text('All')))
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: -10,
                              child: _catButton(const Icon(
                                  Icons.battery_charging_full_sharp))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: -30,
                              child: _catButton(
                                  const Icon(Icons.rocket_launch_outlined))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(clipBehavior: Clip.none, children: [
                        Positioned(
                            top: -50,
                            child: _catButton(
                                const Icon(Icons.nature_people_sharp)))
                      ]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: -70,
                              child: _catButton(const Icon(Icons.person)))
                        ],
                      ),
                    ),
                  ],
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 165 / 200,
                  crossAxisCount: 2,
                  children: List.generate(10, (index) {
                    return const Item();
                  }),
                )
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavBar(),
          )
        ],
      ),
    );
  }

  Widget _catButton(Widget child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: MyIconButton(
            onTap: () {},
            firstColor: const Color(0xFF363E51).withOpacity(0.7),
            secondColor: const Color(0xFF191E26).withOpacity(0.7),
            begin: const Alignment(0.22, -0.98),
            end: const Alignment(-0.22, 0.98),
            child: child,
          ),
        ),
      );
}
