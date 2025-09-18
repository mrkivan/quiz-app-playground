import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';

part 'result_screen_data.freezed.dart';

part 'result_screen_data.g.dart';

@freezed
class ResultScreenData with _$ResultScreenData {
  const factory ResultScreenData({
    String? quizTitle,
    String? quizDescription,
    required List<ResultItem> correctItems,
    required List<ResultItem> skippedItems,
    required List<ResultItem> incorrectItems,
    required int totalCorrectItems,
    required int totalSkippedItems,
    required int totalInCorrectItems,
    required int totalQuestions,
    required int resultPercentage,
  }) = _ResultScreenData;

  factory ResultScreenData.fromJson(Map<String, dynamic> json) => _$ResultScreenDataFromJson(json);
}
