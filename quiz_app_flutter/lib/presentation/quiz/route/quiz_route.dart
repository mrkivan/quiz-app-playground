import 'package:flutter/material.dart';
class QuizRoute extends StatelessWidget {
  final int quizId;
  const QuizRoute({super.key, required this.quizId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Quiz Screen for quizId: $quizId')),
    );
  }
}