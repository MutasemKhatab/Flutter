import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money/provider/spot_provider.dart';
import 'package:money/widgets/spot.dart';
import 'package:money/widgets/step.dart' as step;

class Spots extends ConsumerStatefulWidget {
  const Spots({super.key});

  @override
  ConsumerState<Spots> createState() => _SpotsState();
}

class _SpotsState extends ConsumerState<Spots> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ref.watch(spotProvider.notifier).getSpots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text('Spots',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500)),
                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemBuilder: (context, index) => Spot(
                                spot: snapshot.data![index],
                              ),
                          itemCount: snapshot.data!.length),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -10,
                  right: MediaQuery.of(context).size.width / 2 - 30,
                  child: GestureDetector(
                    onTap: showSheet,
                    child: Container(
                      width: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.arrow_drop_up,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  void showSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              controller: scrollController,
              children: const [
                Text(
                  'Bulls make money, bears make money, pigs get slaughtered',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Must follow the rules if you want to make money from crypto market',
                ),
                SizedBox(height: 20),
                step.Step(
                    title: 'Plane..',
                    subtitle:
                        'Before Entering Into Crypto Market Must Set Your Mind And Start Journey With Proper Plan. Don\'t Do This Like Time Pass. Plan For How Much You Want To Earn Day, Weekly And Monthly.',
                    icon: '1️⃣'),
                SizedBox(height: 20),
                step.Step(
                    title: 'Investment...',
                    subtitle:
                        'Second And Main Thing is Investment. Don\'t Trade With Borrowed Amount. Invest Only Which Is Not Your Personal Need. Don\'t Invest All Amount in One Signal.',
                    icon: '2️⃣'),
                SizedBox(height: 20),
                step.Step(
                    title: 'Trade Strategies...',
                    subtitle:
                        '''If You Have 1000\$ in Your wallet. Put 2-4% on One Trade.
                        
                        ■ If You invested 40\$ in One Trade Then invest in 3 Parts.
                        
                        1 Entry- 20\$
                        
                        2 Entry_10\$
                        
                        3 Entry_10\$
                        
                        After Doing Average You will be Able To Buy More and More In Dip''',
                    icon: '3️⃣'),
                SizedBox(height: 20),
                step.Step(
                    title: 'Leverage...',
                    subtitle:
                        '''When You Enter in One trade Use Leverage According To your Risk Management. Don't Use high leverage and High Margin Together. Use Safe Leverage.
                        
                        Recommend is :- 1X''',
                    icon: '4️⃣'),
                SizedBox(height: 20),
                step.Step(
                    title: 'Take Profit...',
                    subtitle: '''
                        Always Book Proot On every TP. And Always Move Stop Loss To Entry Ranges.
                        
                        1st TP: 25%
                        
                        2nd TP: 25\$
                        
                        3rd TP: 25%
                        
                        4th TP: 25\$
                        
                        If Trade Hit First TP Move Stop Loss To Entry
                        
                        Price 1''',
                    icon: '5️⃣'),
                SizedBox(height: 20),
                step.Step(
                    title: 'Stop Loss...',
                    subtitle:
                        'Panic Sellers Always Put Stop Loss. if You are Trading With Proper Risk Management Then Stop Loss is Not Necessary.',
                    icon: '6️⃣'),
                SizedBox(height: 20),
                step.Step(
                    title: 'Risk Management...',
                    subtitle:
                        'If You are Not Be Able To Trade with Proper Risk Management Then Definitely You will Loss every thing. Always Trade with 2_3% Risk not More.',
                    icon: '7️⃣'),
                SizedBox(height: 20),
                step.Step(
                    title: 'How Many Trades are Safe ',
                    subtitle:
                        'Only Entre into 2_4 Trades Not More. if You entre into to much calls Then Definitely Your portfolio Liquidate if MARKET comes Down. so Always Try To Trade only on Few Calls.',
                    icon: '8️⃣'),
                SizedBox(height: 20),
                step.Step(
                    title: 'Panic Situation...',
                    subtitle:
                        'Don\'t Panic In any situation. If You Follow all Uper rules. Then Definitely Sudden Dumps Never Affect Your Portfolio.',
                    icon: '9️⃣'),
                SizedBox(height: 20),
                step.Step(
                    title: 'Great Advice...',
                    subtitle:
                        'Must Work With Patience. Increase Your Patience level and decrease your Greed level. Don\'t Be Greedy in This Market. Earn Something Daily Don\'t Think To Be A Billionaire in One Night. Everyone wants advice, but when you give it....no one really takes it.',
                    icon: '🔟'),
              ],
            );
          }),
    );
  }
}
