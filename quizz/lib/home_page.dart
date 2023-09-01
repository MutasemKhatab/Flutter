import 'package:flutter/material.dart';
import 'package:quizz/questions_data.dart';
import 'package:quizz/questions_page.dart';
import 'package:quizz/result_page.dart';

const Color darkPurpul = Color.fromRGBO(109, 2, 131, 1);
const Color whitePurpul = Color.fromARGB(255, 225, 0, 255);
const Color myWhite = Color.fromARGB(192, 255, 255, 255);
const Color myBlack = Color.fromARGB(150, 0, 0, 0);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget? activeWidget;

  @override
  void initState() {
    activeWidget = Welcome(switchScreens);
    super.initState();
  }

  void switchScreens() {
    setState(() {
      if (qCounter < questionsData.length) {
        activeWidget = QuestionsPage(switchScreens, questionsData[qCounter]);
      }
      else {
        activeWidget = ResultPage(switchScreens);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [darkPurpul, whitePurpul],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: activeWidget,
        ),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome(this.switchScreens, {Key? key}) : super(key: key);
  final void Function() switchScreens;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              height: 300,
              color: myWhite,
            ),
            const Text(
              "Learn Flutter The Fun Way",
              style: TextStyle(
                color: myWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right),
              onPressed: switchScreens,
              style: OutlinedButton.styleFrom(foregroundColor: myWhite),
              label: const Text(
                "Start Quiz Now",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
