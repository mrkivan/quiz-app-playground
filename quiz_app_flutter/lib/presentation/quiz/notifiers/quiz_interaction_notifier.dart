import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_intent.dart'; // Adjust import for QuizIntent
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../quiz_state.dart';
import 'quiz_data_notifier.dart';
import 'quiz_result_notifier.dart';

part 'quiz_interaction_notifier.g.dart';

@riverpod
class QuizInteractionNotifier extends _$QuizInteractionNotifier {
  @override
  QuizState build({required QuizScreenData screenData}) {
    return QuizState();
  }

  /// Handle interaction intents (e.g., UpdateSelectedAnswers, SubmitAnswer)
  void handleInteractionIntent(QuizIntent intent) {
    if (intent is UpdateSelectedAnswers) {
      state = state.copyWith(selectedAnswers: intent.answers);
    } else if (intent is SubmitAnswer) {
      _submitAnswer();
    }
  }

  void _submitAnswer() {
    final currentQuiz = ref.read(quizDataNotifierProvider(screenData: screenData).notifier).currentQuiz;
    final isCorrect = currentQuiz.correctAnswer.answerId.toSet() == state.selectedAnswers.toSet();
    state = state.copyWith(isSubmitted: true, showExplanation: true);
    ref.read(quizResultNotifierProvider(screenData: screenData).notifier).setQuizResult(isCorrect);
  }

  void updateQuizState({required int currentQuestionNumber, required int totalQuestions, required bool isLastItem}) {
    state = state.copyWith(
      currentQuestionNumber: currentQuestionNumber,
      totalQuestions: totalQuestions,
      isLastItem: isLastItem,
    );
  }

  void resetForNextQuestion() {
    state = state.copyWith(
      selectedAnswers: [],
      isSubmitted: false,
      showExplanation: false,
      // Add other fields if needed, e.g., if QuizState has more
    );
  }
}
