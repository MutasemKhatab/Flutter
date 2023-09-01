import 'package:flutter/material.dart';
import 'package:quizz/home_page.dart';
import 'package:quizz/questions_data.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this.switchScreens, {Key? key}) : super(key: key);
  final void Function() switchScreens;
  @override
  Widget build(BuildContext context) {
    int score = 0;
    for (var element in userAnswers) {
      if (element.rightAns) {
        score++;
      }
    }
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You ANSWERED $score out of ${questionsData.length} questions correctly",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: myWhite,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                child: Column(
                  children: [
                    ...questionsData.map((question) {
                      return QuestionRow(question);
                    })
                  ],
                ),
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: () {
            qCounter = 0;
            userAnswersCounter = 0;
            userAnswers = [];
            switchScreens();
          },
          icon: const Icon(
            Icons.rotate_right,
            color: Colors.white,
          ),
          label:
              const Text("Restart Quiz", style: TextStyle(color: Colors.white)),
        ),
      ],
    ));
  }
}

class QuestionRow extends StatelessWidget {
  const QuestionRow(this.question, {Key? key}) : super(key: key);
  final Question question;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: CircleAvatar(
                radius: 15,
                backgroundColor: userAnswers[userAnswersCounter].rightAns
                    ? const Color.fromARGB(255, 115, 189, 246)
                    : const Color.fromARGB(255, 255, 102, 243),
                child: Text(
                  "${userAnswersCounter + 1}",
                  style: const TextStyle(
                      color: darkPurpul, fontWeight: FontWeight.bold),
                ))),
        SizedBox(
          width: 240,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.question,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Text(userAnswers[userAnswersCounter++].answer,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 245, 172, 255))),
              Text(question.getRightAnswer(),
                  style: const TextStyle(color: Colors.lightBlueAccent)),
            ],
          ),
        ),
      ],
    );
  }
}
