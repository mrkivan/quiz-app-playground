import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';

part 'quiz_intent.freezed.dart';

@freezed
class QuizIntent with _$QuizIntent {
  const factory QuizIntent.loadQuiz(QuizScreenData data) = LoadQuiz;

  const factory QuizIntent.nextQuestion() = NextQuestion;

  const factory QuizIntent.skipQuestion() = SkipQuestion;

  const factory QuizIntent.updateSelectedAnswers(List<int> answers) = UpdateSelectedAnswers;

  const factory QuizIntent.submitAnswer() = SubmitAnswer;
}
