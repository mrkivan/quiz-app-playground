import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_data.freezed.dart';
part 'result_data.g.dart';

@freezed
class ResultItem with _$ResultItem {
  const factory ResultItem({
    required int questionId,
    required String question,
    required bool result,
    String? answerSectionTitle,
    required List<String> correctAnswer,
    required String explanation,
    @Default(false) bool isSkipped,
  }) = _ResultItem;

  factory ResultItem.fromJson(Map<String, dynamic> json) => _$ResultItemFromJson(json);
}

@freezed
class ResultData with _$ResultData {
  const factory ResultData({
    String? quizTitle,
    String? quizDescription,
    required List<ResultItem> resultItems,
    required int totalCorrectAnswers,
    required int totalQuestions,
    required int resultPercentage,
  }) = _ResultData;

  factory ResultData.fromJson(Map<String, dynamic> json) => _$ResultDataFromJson(json);
}
