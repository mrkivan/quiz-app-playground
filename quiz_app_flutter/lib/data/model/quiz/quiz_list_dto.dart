// features/quiz/data/models/quiz_list_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_list_dto.freezed.dart';
part 'quiz_list_dto.g.dart';

@freezed
class QuizListDto with _$QuizListDto {
  const factory QuizListDto({
    required int total,
    required List<QuizItemDto> items,
  }) = _QuizListDto;

  factory QuizListDto.fromJson(Map<String, dynamic> json) =>
      _$QuizListDtoFromJson(json);
}

@freezed
class QuizItemDto with _$QuizItemDto {
  const factory QuizItemDto({
    required int questionId,
    required String question,
    required int answerCellType,
    List<int>? selectedOptions,
    String? answerSectionTitle,
    required String explanation,
    required List<AnswerCellDto> answerCellList,
    required CorrectAnswerDto correctAnswer,
  }) = _QuizItemDto;

  factory QuizItemDto.fromJson(Map<String, dynamic> json) =>
      _$QuizItemDtoFromJson(json);
}

@freezed
class AnswerCellDto with _$AnswerCellDto {
  const factory AnswerCellDto({
    required int answerId,
    required int questionId,
    required String data,
    required bool isItAnswer,
    required int position,
  }) = _AnswerCellDto;

  factory AnswerCellDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerCellDtoFromJson(json);
}

@freezed
class CorrectAnswerDto with _$CorrectAnswerDto {
  const factory CorrectAnswerDto({
    required int questionId,
    required List<int> answerId,
    required List<String> answer,
    required String explanation,
  }) = _CorrectAnswerDto;

  factory CorrectAnswerDto.fromJson(Map<String, dynamic> json) =>
      _$CorrectAnswerDtoFromJson(json);
}
