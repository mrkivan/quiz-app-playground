import 'dart:async';

import 'package:quiz_app_flutter/domain/entities/result/result_data.dart'; // Adjust import for ResultData
import 'package:quiz_app_flutter/domain/usecase/result/save_result_data_usecase.dart';
import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_intent.dart'; // Adjust import for QuizIntent
import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_nav_event.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'quiz_data_notifier.dart';
import 'quiz_interaction_notifier.dart';

part 'quiz_result_notifier.g.dart';

@riverpod
class QuizResultNotifier extends _$QuizResultNotifier {
  final _navigationEventsController = StreamController<QuizNavEvent>.broadcast();

  Stream<QuizNavEvent> get navigationEvents => _navigationEventsController.stream;

  final List<ResultItem> _resultItems = [];

  @override
  bool? build({required QuizScreenData screenData}) {
    ref.onDispose(() {
      _navigationEventsController.close();
    });
    return null;
  }

  /// Set quiz result state (correct/incorrect)
  void setQuizResult(bool isCorrect) {
    state = isCorrect;
  }

  /// Save result for current question
  void saveResult({bool isSkipped = false}) {
    final currentQuiz = ref.read(quizDataNotifierProvider(screenData: screenData).notifier).currentQuiz;
    final selectedAnswers = ref.read(quizInteractionNotifierProvider(screenData: screenData)).selectedAnswers;

    final resultItem = ResultItem(
      questionId: currentQuiz.questionId,
      question: currentQuiz.question,
      result: currentQuiz.correctAnswer.answerId.toSet() == selectedAnswers.toSet(),
      answerSectionTitle: currentQuiz.answerSectionTitle,
      correctAnswer: currentQuiz.correctAnswer.answer,
      explanation: currentQuiz.explanation,
      isSkipped: isSkipped,
    );
    _resultItems.add(resultItem);
  }

  /// Handle result-related intents (e.g., NavigateToResult)
  Future<void> handleResultIntent(QuizIntent intent) async {
    if (intent is NavigateToResult) {
      await navigateToResultScreen();
    }
  }

  Future<void> navigateToResultScreen() async {
    final totalQuiz = ref.read(quizDataNotifierProvider(screenData: screenData).notifier).totalQuiz;
    final correctAnswers = _resultItems.where((item) => item.result).length;
    final resultData = ResultData(
      quizTitle: screenData.quizTitle,
      quizDescription: screenData.quizDescription,
      resultItems: _resultItems,
      totalCorrectAnswers: correctAnswers,
      totalQuestions: totalQuiz,
      resultPercentage: ((correctAnswers / totalQuiz) * 100).toInt(),
    );

    final useCase = await ref.read(saveResultDataUseCaseProvider.future);
    await useCase(screenData.quizSection?.fileName ?? '', resultData);
    _navigationEventsController.add(QuizNavEvent.navigateToResult(screenData.quizSection?.fileName ?? ''));
  }
}
