import 'package:flutter/material.dart';
import 'package:trade_guru/helpers/lang.dart';
import 'package:trade_guru/widgets/my_text_field.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class GuruRobot extends StatefulWidget {
  const GuruRobot({super.key});

  @override
  State<GuruRobot> createState() => _GuruRobotState();
}

class _GuruRobotState extends State<GuruRobot> {
  final controller = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  bool doneCalculating = false;
  double? total;
  double? netProfit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          Lang.guroRobot,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded),
            onPressed: () {
              showDialog(
                context: context,
                barrierColor:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                builder: (context) => AlertDialog(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  title: Text(
                    Lang.howToUseTheCalculator,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Lang.selectTheStartingDate,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Lang.selectTheEndDate,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Lang.enterTheInvestmentAmount,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Lang.clickOnTheCalculateButton,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Lang.theProfitWillBeCalculated,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
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
                ),
              );
            },
          )
        ],
        centerTitle: true,
        backgroundColor: const Color(0xFF131723),
      ),
      backgroundColor: const Color(0xFF0A0A0A),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              Lang.theTradeGuruRobotHasProvenItsSuccessOver3YearsOfTradingYouCanLookAtItsResults,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.all(10),
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime(2021),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2023, 12, 31),
                      barrierColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          startDate = value;
                        });
                      }
                    });
                  },
                  child: Text(
                    startDate != null
                        ? DateFormat('yyyy-MM').format(startDate!)
                        : Lang.selectStartDate,
                  ),
                )),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.all(10),
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                  ),
                  onPressed: startDate == null
                      ? () {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              content: Text(Lang.selectStartingDateFirst),
                            ),
                          );
                        }
                      : () {
                          showDatePicker(
                            context: context,
                            initialDate: startDate,
                            firstDate: startDate!,
                            lastDate: DateTime(2023, 12, 31),
                            barrierColor: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.1),
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                endDate = value;
                              });
                            }
                          });
                        },
                  child: Text(
                    endDate != null
                        ? DateFormat('yyyy-MM').format(endDate!)
                        : Lang.selectEndDate,
                  ),
                )),
            const SizedBox(height: 20),
            // investment
            MyTextField(
              label: Lang.investmentAmount,
              controller: controller,
              keyboardType: TextInputType.number,
              icon: Icons.attach_money_rounded,
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                if (startDate == null || endDate == null) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      content: Text(Lang.selectDates),
                    ),
                  );
                  return;
                }
                if (controller.text.isEmpty) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      content: Text(Lang.selectInvestmentAmount),
                    ),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    content: Text(Lang.calculating),
                  ),
                );
                final results = _calculate();
                total = results[0];
                netProfit = results[1];
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    content: Text(Lang.doneCalculating),
                  ),
                );
                setState(() {
                  doneCalculating = true;
                });
              },
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                side: const BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                Lang.calculate,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            if (doneCalculating)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        Lang.netProfit,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        netProfit!.toStringAsFixed(2),
                        style: const TextStyle(
                          color: Color(0xff00DF53),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        Lang.total,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        total!.toStringAsFixed(2),
                        style: const TextStyle(
                          color: Color(0xff00DF53),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 10),
            Text(
                Lang.belowYouCanCopyTradeGuruRobotTradesCompletelyFreeOfChargeOnNagaDoNotMissTheOpportunityToProfitConvenientlyAndWithoutAnyHassle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                launchUrl(Uri.parse(
                    'https://www.naga.com/register?cmp=8y4s4d2d&refid=3210'));
              },
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                side: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                Lang.registerNow,
                style: const TextStyle(color: Colors.red, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Calculates the total return and profit from an investment based on given data.
  ///
  /// The [data] list contains historical percentage values for each month.
  /// The [investment] parameter represents the initial investment amount.
  /// The [startDate] and [endDate] parameters specify the range of months to consider.
  ///
  ///```dart
  ///for (int month = 0; month < yearData.length; month++) {
  ///   double percentage = yearData[month] / 100;
  ///   total = newInvestment + newInvestment * percentage;
  ///   newInvestment = total;}
  /// ```
  /// Returns a list containing the total return and profit.
  List<double> _calculate() {
    // data for the calculator
    List<double> data = [
      1.57,
      6.16,
      18.71,
      20.2,
      25,
      20.4,
      7.18,
      16.59,
      14.24,
      6.17,
      8.74,
      6.02,
      15.94,
      27.51,
      17.22,
      4.88,
      17.11,
      7.75,
      22.44,
      15.38,
      15.08,
      5.23,
      6.76,
      3.62,
      18.14,
      14.89,
      10.18,
      8.55,
      14.72,
      15.68,
      13.09,
      13.06,
      6.11,
      2.15,
      6.51,
      3.49
    ];

    // this is the data for the calculator
    double investment = double.parse(controller.text);

    int startingYear = startDate!.year;
    int endingYear = endDate!.year;
    int startingMonth = startDate!.month;
    int endingMonth = endDate!.month;

    int numberOfMonths = 0;

    //calculate the number of months
    if (startingYear == endingYear) {
      numberOfMonths = endingMonth - startingMonth;
    } else {
      numberOfMonths = 12 - startingMonth + endingMonth;
      numberOfMonths += (endingYear - startingYear - 1) * 12;
    }
    final yearData =
        data.sublist(startingMonth - 1, startingMonth - 1 + numberOfMonths + 1);

    //the results
    double total = 0;
    double newInvestment = investment;

    //calculating the total
    for (int month = 0; month < yearData.length; month++) {
      double percentage = yearData[month] / 100;
      total = newInvestment + newInvestment * percentage;
      newInvestment = total;
    }
    return [total, total - investment];
  }
}
