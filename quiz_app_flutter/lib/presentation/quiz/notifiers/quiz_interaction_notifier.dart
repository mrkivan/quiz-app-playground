import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_intent.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_data_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_result_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/state/quiz_state.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_interaction_notifier.g.dart';

@riverpod
class QuizInteractionNotifier extends _$QuizInteractionNotifier {
  @override
  QuizState build({required QuizScreenData screenData}) {
    return QuizState();
  }

  void updateQuizStateWithInteraction() {
    state = state.copyWith(hasInteracted: true);
  }

  void handleInteractionIntent(QuizIntent intent) {
    if (intent is UpdateSelectedAnswers) {
      state = state.copyWith(selectedAnswers: intent.answers, hasInteracted: true);
    } else if (intent is SubmitAnswer) {
      _submitAnswer();
    }
  }

  void _submitAnswer() {
    final currentQuiz = ref.read(quizDataNotifierProvider(screenData: screenData).notifier).currentQuiz;
    final isCorrect = currentQuiz.correctAnswer.answerId.toSet() == state.selectedAnswers.toSet();
    state = state.copyWith(isSubmitted: true, showExplanation: true, hasInteracted: true);
    // Store isCorrect for next question or result
    ref.read(quizResultNotifierProvider(screenData: screenData).notifier).setPendingResult(isCorrect);
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
      hasInteracted: state.hasInteracted, // Preserve hasInteracted
    );
  }
}
