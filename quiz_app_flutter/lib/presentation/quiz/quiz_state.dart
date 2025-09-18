import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_state.freezed.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState({
    @Default([]) List<int> selectedAnswers,
    @Default(false) bool isSubmitted,
    @Default(false) bool showExplanation,
    @Default(false) bool isLastItem,
    @Default(0) int currentQuestionNumber,
    @Default(0) int totalQuestions,
  }) = _QuizState;
}
