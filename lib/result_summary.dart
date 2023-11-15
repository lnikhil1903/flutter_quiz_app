import 'package:flutter/material.dart';
import 'package:quiz_app/question_identifier.dart';

class ResultSummary extends StatelessWidget {
  ResultSummary(this.summaryData, {super.key});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      children: summaryData
          .map(
            (e) => Row(
              children: [
                QuestionIdentifier(
                    e['question_index'] as int, e['is_correct'] as bool),
                Expanded(
                  child: Column(
                    children: [
                      Text(e['question'] as String),
                      Text(e['selected_answer'] as String),
                      Text(e['correct_answer'] as String),
                    ],
                  ),
                )
              ],
            ),
          )
          .toList(),
    );
  }
}
