// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizListDtoImpl _$$QuizListDtoImplFromJson(Map<String, dynamic> json) =>
    _$QuizListDtoImpl(
      total: (json['total'] as num).toInt(),
      items:
          (json['items'] as List<dynamic>)
              .map((e) => QuizItemDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$QuizListDtoImplToJson(_$QuizListDtoImpl instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};

_$QuizItemDtoImpl _$$QuizItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$QuizItemDtoImpl(
      questionId: (json['questionId'] as num).toInt(),
      question: json['question'] as String,
      answerCellType: (json['answerCellType'] as num).toInt(),
      selectedOptions:
          (json['selectedOptions'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      answerSectionTitle: json['answerSectionTitle'] as String?,
      explanation: json['explanation'] as String,
      answerCellList:
          (json['answerCellList'] as List<dynamic>)
              .map((e) => AnswerCellDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      correctAnswer: CorrectAnswerDto.fromJson(
        json['correctAnswer'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$QuizItemDtoImplToJson(_$QuizItemDtoImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'question': instance.question,
      'answerCellType': instance.answerCellType,
      'selectedOptions': instance.selectedOptions,
      'answerSectionTitle': instance.answerSectionTitle,
      'explanation': instance.explanation,
      'answerCellList': instance.answerCellList,
      'correctAnswer': instance.correctAnswer,
    };

_$AnswerCellDtoImpl _$$AnswerCellDtoImplFromJson(Map<String, dynamic> json) =>
    _$AnswerCellDtoImpl(
      answerId: (json['answerId'] as num).toInt(),
      questionId: (json['questionId'] as num).toInt(),
      data: json['data'] as String,
      isItAnswer: json['isItAnswer'] as bool,
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$$AnswerCellDtoImplToJson(_$AnswerCellDtoImpl instance) =>
    <String, dynamic>{
      'answerId': instance.answerId,
      'questionId': instance.questionId,
      'data': instance.data,
      'isItAnswer': instance.isItAnswer,
      'position': instance.position,
    };

_$CorrectAnswerDtoImpl _$$CorrectAnswerDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CorrectAnswerDtoImpl(
  questionId: (json['questionId'] as num).toInt(),
  answerId:
      (json['answerId'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  answer: (json['answer'] as List<dynamic>).map((e) => e as String).toList(),
  explanation: json['explanation'] as String,
);

Map<String, dynamic> _$$CorrectAnswerDtoImplToJson(
  _$CorrectAnswerDtoImpl instance,
) => <String, dynamic>{
  'questionId': instance.questionId,
  'answerId': instance.answerId,
  'answer': instance.answer,
  'explanation': instance.explanation,
};
