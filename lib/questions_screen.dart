import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen(this.onAnswer, this.setCompleted, {super.key});
  void Function(String, int) onAnswer;
  void Function(bool) setCompleted;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQindex = 0;
  List<int> skipped = [];
  bool startedSkipped = true;

  void evaluate(String ans) {
    widget.onAnswer(ans, currentQindex);

    setState(() {
      if (startedSkipped) {
        currentQindex++;
      }
      if (currentQindex == questions.length) {
        startedSkipped = false;
      }
      if (skipped.isEmpty && !startedSkipped) {
        widget.setCompleted(true);
      }
      if (!startedSkipped) {
        currentQindex = skipped[0];
        skipped.removeAt(0);
        startedSkipped = false;
      }
    });
  }

  void skipEvaluate() {
    setState(() {
      skipped.add(currentQindex);
      currentQindex++;
    });
  }

  @override
  Widget build(context) {
    QuizQuestion currentQuestion = questions[currentQindex];
    return GradientContainer(
      sub: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 45),
                  child: Text(currentQuestion.question,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          color: Color.fromARGB(181, 146, 205, 233),
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                ...currentQuestion.getShuffledAnswers().map((item) {
                  return AnswerButton(item, () {
                    evaluate(item);
                  });
                }),
                Visibility(
                  visible: startedSkipped,
                  child: ElevatedButton(
                      onPressed: () {
                        skipEvaluate();
                      },
                      child: Text('skip')),
                )
              ]),
        ),
      ),
    );
  }
}
