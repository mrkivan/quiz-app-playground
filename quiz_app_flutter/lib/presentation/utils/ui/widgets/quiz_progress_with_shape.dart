import 'package:flutter/material.dart';

class QuizProgressWithShape extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const QuizProgressWithShape({super.key, required this.currentQuestion, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.zero,
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Text(
        '$currentQuestion/$totalQuestions',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}
