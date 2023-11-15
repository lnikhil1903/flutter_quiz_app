import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return GradientContainer(
      sub: Center(
        child: Column(
          children: [
            const SizedBox(height: 150),
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 250,
              height: 250,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(height: 100),
            const Text(
              'Learn Flutter the fun way',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(height: 50),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(116, 29, 16, 88)),
              icon: const Icon(Icons.arrow_right),
              label: const Text(
                'Start Quiz',
                style: TextStyle(fontSize: 26.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
