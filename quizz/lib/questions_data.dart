class Question {
  Question(this.question, this.answers) {
    answers.shuffle();
  }
  String question;
  List<Answer> answers;
  String getRightAnswer() {
    for (var element in answers) {
      if (element.rightAns) return element.answer;
    }
    return "";
  }
}

class Answer {
  Answer(this.answer, this.rightAns);
  String answer;
  bool rightAns;
}

int qCounter = 0;
final questionsData = [
  Question("What's my name", [
    Answer("Mo", true),
    Answer("M3tasem", false),
    Answer("Mutassem", false),
    Answer("Mu'tasem", false),
  ]),
  Question("What's my last name", [
    Answer("Khatab", true),
    Answer("5a6ab", false),
    Answer("Katab", false),
    Answer("Khattab", false),
  ]),
  Question(
    'What are the main building blocks of Flutter UIs?',
    [
      Answer('Widgets', true),
      Answer('Components', false),
      Answer('Blocks', false),
      Answer('Functions', false),
    ],
  ),
  Question('How are Flutter UIs built?', [
    Answer('By combining widgets in code', true),
    Answer('By combining widgets in a visual editor', false),
    Answer('By defining widgets in config files', false),
    Answer('By using XCode for iOS and Android Studio for Android', false),
  ]),
  Question(
    'What\'s the purpose of a StatefulWidget?',
    [
      Answer('Update UI as data changes', true),
      Answer('Update data as UI changes', false),
      Answer('Ignore data changes', false),
      Answer('Render UI that does not depend on data', false),
    ],
  ),
  Question(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      Answer('StatelessWidget', true),
      Answer('StatefulWidget', false),
      Answer('Both are equally good', false),
      Answer('None of the above', false),
    ],
  ),
  Question(
    'What happens if you change data in a StatelessWidget?',
    [
      Answer('The UI is not updated', true),
      Answer('The UI is updated', false),
      Answer('The closest StatefulWidget is updated', false),
      Answer('Any nested StatefulWidgets are updated', false),
    ],
  ),
  Question(
    'How should you update data inside of StatefulWidgets?',
    [
      Answer('By calling setState()', true),
      Answer('By calling updateData()', false),
      Answer('By calling updateUI()', false),
      Answer('By calling updateState()', false),
    ],
  ),
];
List<Answer> userAnswers = [];
int userAnswersCounter = 0;
