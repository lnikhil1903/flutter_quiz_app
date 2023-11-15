import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget sub;
  const GradientContainer({required this.sub, super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 9, 6, 32),
          Color.fromARGB(255, 0, 0, 0)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: sub,
    );
  }
}
