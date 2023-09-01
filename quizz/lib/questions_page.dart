import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/questions_data.dart';
import 'home_page.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage(this.switchScreens, this.question, {Key? key})
      : super(key: key);
  final void Function() switchScreens;
  final Question question;
  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Text(
              textAlign: TextAlign.center,
              widget.question.question,
              style: GoogleFonts.lato(
                color: myWhite,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              ...widget.question.answers.map((answer) {
                return MyButton(widget.switchScreens, answer);
              })
            ],
          )
        ],
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton(this.switchScreens, this.answerTxt, {Key? key})
      : super(key: key);
  final Answer answerTxt;
  final void Function() switchScreens;

  @override
  State<MyButton> createState() => _MyButton();
}

class _MyButton extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        qCounter++;
        userAnswers.add(widget.answerTxt);
        widget.switchScreens();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: (myWhite),
        minimumSize: const Size(260, 40),
        maximumSize: const Size(260, 40),
        backgroundColor: (myBlack),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(widget.answerTxt.answer, textAlign: TextAlign.center),
    );
  }
}
