import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  QuestionIdentifier(this.index, this.isCorrect, {super.key});
  int index;
  bool isCorrect;

  @override
  Widget build(context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        color: isCorrect
            ? const Color.fromARGB(113, 76, 175, 79)
            : Color.fromARGB(175, 207, 86, 78),
      ),
      child: Text(index.toString()),
    );
  }
}
