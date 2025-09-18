import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_data.freezed.dart';
part 'quiz_data.g.dart';

bool _boolFromJson(dynamic value) => value == 1;

int _boolToJson(bool value) => value ? 1 : 0;

@freezed
class QuizAnswerCell with _$QuizAnswerCell {
  const factory QuizAnswerCell({
    required int answerId,
    required int questionId,
    required String data,
    @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson) required bool isItAnswer,
    required int position,
  }) = _QuizAnswerCell;

  factory QuizAnswerCell.fromJson(Map<String, dynamic> json) => _$QuizAnswerCellFromJson(json);
}

@freezed
class QuizCorrectAnswer with _$QuizCorrectAnswer {
  const factory QuizCorrectAnswer({
    required int questionId,
    required List<int> answerId,
    required List<String> answer,
    required String explanation,
  }) = _QuizCorrectAnswer;

  factory QuizCorrectAnswer.fromJson(Map<String, dynamic> json) => _$QuizCorrectAnswerFromJson(json);
}

@freezed
class QuizData with _$QuizData {
  const factory QuizData({
    required int questionId,
    required String question,
    required int answerCellType,
    List<int>? selectedOptions,
    String? answerSectionTitle,
    required String explanation,
    required List<QuizAnswerCell> answerCellList,
    required QuizCorrectAnswer correctAnswer,
  }) = _QuizData;

  factory QuizData.fromJson(Map<String, dynamic> json) => _$QuizDataFromJson(json);
}
