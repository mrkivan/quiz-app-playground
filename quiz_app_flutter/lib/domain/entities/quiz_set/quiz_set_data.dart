import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';

part 'quiz_set_data.freezed.dart';
part 'quiz_set_data.g.dart';

ResultData? _resultDataFromJson(Map<String, dynamic>? json) {
  return json == null ? null : ResultData.fromJson(json);
}

Map<String, dynamic>? _resultDataToJson(ResultData? instance) {
  return instance?.toJson();
}

@freezed
class QuizSetItem with _$QuizSetItem {
  const factory QuizSetItem({
    required String title,
    required String description,
    required int position,
    required String fileName,
    @JsonKey(fromJson: _resultDataFromJson, toJson: _resultDataToJson) ResultData? previousResult,
  }) = _QuizSetItem;

  factory QuizSetItem.fromJson(Map<String, dynamic> json) => _$QuizSetItemFromJson(json);
}

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

  factory QuizSetData.fromJson(Map<String, dynamic> json) => _$QuizSetDataFromJson(json);
}
