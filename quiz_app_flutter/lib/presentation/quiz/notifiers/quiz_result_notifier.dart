import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart'; // Adjust import for ResultData
import 'package:quiz_app_flutter/domain/usecase/result/save_result_data_usecase.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'quiz_data_notifier.dart';
import 'quiz_interaction_notifier.dart';

part 'quiz_result_notifier.g.dart';

@Riverpod(keepAlive: true)
class QuizResultNotifier extends _$QuizResultNotifier {
  final List<ResultItem> _resultItems = [];

  @override
  bool? build({required QuizScreenData screenData}) {
    // Ensure _resultItems is not cleared on provider rebuild
    return null;
  }

  /// Set quiz result state (correct/incorrect)
  void setQuizResult(bool isCorrect) {
    state = isCorrect;
  }

  /// Save result for current question
  void saveResult({bool isSkipped = false}) {
    final quizData = ref.read(quizDataNotifierProvider(screenData: screenData).notifier).currentQuiz;
    final selectedAnswers = ref.read(quizInteractionNotifierProvider(screenData: screenData)).selectedAnswers;
    final isCorrect = quizData.correctAnswer.answerId.toSet() == selectedAnswers.toSet();
    final resultItem = ResultItem(
      question: quizData.question,
      correctAnswer: quizData.correctAnswer.answer,
      explanation: quizData.explanation,
      result: isCorrect,
      isSkipped: isSkipped,
      questionId: quizData.questionId,
    );
    debugPrint("------saveResultData $resultItem, Total Items: ${_resultItems.length + 1}");
    _resultItems.add(resultItem);
  }

  /// Save result data and return the key for navigation
  Future<String> saveResultData() async {
    debugPrint("------saveResultData enter $_resultItems");
    final totalQuiz = ref.read(quizDataNotifierProvider(screenData: screenData).notifier).totalQuiz;
    final correctAnswers = _resultItems.where((item) => item.result).length;
    final resultData = ResultData(
      quizTitle: screenData.quizTitle,
      quizDescription: screenData.quizDescription,
      resultItems: _resultItems.toList(),
      // Create a copy to ensure immutability
      totalCorrectAnswers: correctAnswers,
      totalQuestions: totalQuiz,
      resultPercentage: totalQuiz > 0 ? ((correctAnswers / totalQuiz) * 100).toInt() : 0,
    );

    final resultKey = screenData.quizSection?.fileName ?? '';
    debugPrint("------saveResultData Key: $resultKey, ResultItems: ${resultData.resultItems.length}");
    final useCase = await ref.read(saveResultDataUseCaseProvider.future);
    await useCase(resultKey, resultData);
    debugPrint("------saveResultData finished");
    return resultKey;
  }
}
