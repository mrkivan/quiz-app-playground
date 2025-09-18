import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';

part 'quiz_screen_data.freezed.dart';
part 'quiz_screen_data.g.dart'; // only if you want JSON serialization

@freezed
class QuizScreenData with _$QuizScreenData {
  const factory QuizScreenData({
    String? quizTitle,
    String? quizDescription,
    QuizSetItem? quizSection,
    @Default(-1) int currentQuizPosition,
  }) = _QuizScreenData;

  // Optional: add this if you need JSON (like passing data between layers)
  factory QuizScreenData.fromJson(Map<String, dynamic> json) => _$QuizScreenDataFromJson(json);
}
