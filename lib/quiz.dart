import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start';
  List<String> chosenAnswers =
      List<String>.generate(questions.length, (index) => 'blank');
  int skipped = 0;
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions';
    });
  }

  void onAnswering(String selectedAnswer, int index) {
    chosenAnswers[index] = selectedAnswer;
  }

  void checkCompleted(bool check) {
    if (check) {
      setState(() {
        activeScreen = 'results';
      });
    }
  }

  @override
  Widget build(context) {
    Widget showScreen = StartScreen(switchScreen);
    if (activeScreen == 'questions') {
      showScreen = QuestionScreen(onAnswering, checkCompleted);
    }
    if (activeScreen == 'results') {
      showScreen = ResultsScreen(chosenAnswers, switchScreen);
    }
    return MaterialApp(
      home: Scaffold(body: showScreen),
    );
  }
}
