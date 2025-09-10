// lib/features/quiz/data/models/quiz_set_data.dart
import 'package:freezed_annotation/freezed_annotation.dart';

import '../result/result_data.dart';

part 'quiz_set_data.freezed.dart';
part 'quiz_set_data.g.dart';

@freezed
class QuizSetData with _$QuizSetData {
  const factory QuizSetData({
    required int total,
    required String title,
    required String topic,
    required String description,
    required int sectionId,
    required List<QuizSetItem> sections,
  }) = _QuizSetData;

  factory QuizSetData.fromJson(Map<String, dynamic> json) =>
      _$QuizSetDataFromJson(json);
}

@freezed
class QuizSetItem with _$QuizSetItem {
  const factory QuizSetItem({
    required String title,
    required String description,
    required int position,
    required String fileName,
    ResultData? previousResult, // nullable by default
  }) = _QuizSetItem;

  factory QuizSetItem.fromJson(Map<String, dynamic> json) =>
      _$QuizSetItemFromJson(json);
}
