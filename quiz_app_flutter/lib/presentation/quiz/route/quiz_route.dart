import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:quiz_app_flutter/presentation/quiz/ui/quiz_screen.dart';

class QuizRoute extends StatelessWidget {
  final QuizScreenData? screenData;

  final int quizId;

  const QuizRoute({super.key, required this.screenData, required this.quizId});

  @override
  Widget build(BuildContext context) {
    if (screenData == null) {
      return Scaffold(body: Center(child: Text('Quiz Data not found')));
    } else {
      return Scaffold(body: QuizScreen(key: key, screenData: screenData!, quizId: quizId));
    }
  }
}
