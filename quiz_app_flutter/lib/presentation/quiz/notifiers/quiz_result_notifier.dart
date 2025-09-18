import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';
import 'package:quiz_app_flutter/domain/usecase/result/save_result_data_usecase.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_data_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_interaction_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'quiz_result_notifier.g.dart';

@Riverpod(keepAlive: true)
class QuizResultNotifier extends _$QuizResultNotifier {
  final List<ResultItem> _resultItems = [];
  bool? _pendingIsCorrect; // Store isCorrect from submit

  @override
  void build({required QuizScreenData screenData}) {
    // No state to initialize
  }

  void setPendingResult(bool isCorrect) {
    _pendingIsCorrect = isCorrect;
  }

  void saveResult({bool isSkipped = false}) {
    final quizData = ref.read(quizDataNotifierProvider(screenData: screenData).notifier).currentQuiz;
    final selectedAnswers = ref.read(quizInteractionNotifierProvider(screenData: screenData)).selectedAnswers;
    final resultItem = ResultItem(
      question: quizData.question,
      correctAnswer: quizData.correctAnswer.answer,
      explanation: quizData.explanation,
      result: _pendingIsCorrect ?? false,
      // Use pending result or false if not submitted
      isSkipped: isSkipped,
      questionId: quizData.questionId,
    );
    debugPrint("Saving result: $resultItem, Total Items: ${_resultItems.length + 1}");
    _resultItems.add(resultItem);
    _pendingIsCorrect = null; // Clear after saving
  }

  Future<String> saveResultData() async {
    debugPrint("Saving final result data: ${_resultItems.length} items");
    final totalQuiz = ref.read(quizDataNotifierProvider(screenData: screenData).notifier).totalQuiz;
    final correctAnswers = _resultItems.where((item) => item.result).length;
    final resultData = ResultData(
      quizTitle: screenData.quizTitle,
      quizDescription: screenData.quizDescription,
      resultItems: _resultItems.toList(),
      totalCorrectAnswers: correctAnswers,
      totalQuestions: totalQuiz,
      resultPercentage: totalQuiz > 0 ? ((correctAnswers / totalQuiz) * 100).toInt() : 0,
    );

    final resultKey = '${screenData.quizSection?.fileName ?? ''}_${Uuid().v4()}';
    debugPrint("Saving with key: $resultKey, ResultItems: ${resultData.resultItems.length}");
    final useCase = await ref.read(saveResultDataUseCaseProvider.future);
    await useCase(resultKey, resultData);
    debugPrint("Result data saved successfully");

    _resultItems.clear(); // Prevent duplicate entries
    return resultKey;
  }
}
