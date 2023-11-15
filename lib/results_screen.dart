import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/result_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.chosenAnswers, this.switchScreen, {super.key});

  final List<String> chosenAnswers;
  void Function() switchScreen;
  List<Map<String, Object>> summaryData = [];

  @override
  Widget build(context) {
    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i + 1,
        'question': questions[i].question,
        'selected_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
        'is_correct': chosenAnswers[i] == questions[i].answers[0] ? true : false
      });
    }

    final numCorrect = summaryData.where(
      (element) {
        return element['selected_answer'] == element['correct_answer'];
      },
    ).length;
    final totalQuestions = questions.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $numCorrect out of $totalQuestions',
            ),
            const SizedBox(
              height: 20,
            ),
            ResultSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton(onPressed: switchScreen, child: Text('Restart')),
          ],
        ),
      ),
    );
  }
}
