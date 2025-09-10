import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/presentation/quiz_set/ui/quiz_set_screen.dart';

class QuizSetRoute extends StatelessWidget {
  final String quizTopic;

  const QuizSetRoute({super.key, required this.quizTopic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: QuizSetScreen(key: key, quizTopic: quizTopic));
  }
}
