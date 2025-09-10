// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizDataImpl _$$QuizDataImplFromJson(Map<String, dynamic> json) =>
    _$QuizDataImpl(
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
              .map((e) => QuizAnswerCell.fromJson(e as Map<String, dynamic>))
              .toList(),
      correctAnswer: QuizCorrectAnswer.fromJson(
        json['correctAnswer'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$QuizDataImplToJson(_$QuizDataImpl instance) =>
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

_$QuizAnswerCellImpl _$$QuizAnswerCellImplFromJson(Map<String, dynamic> json) =>
    _$QuizAnswerCellImpl(
      answerId: (json['answerId'] as num).toInt(),
      questionId: (json['questionId'] as num).toInt(),
      data: json['data'] as String,
      isItAnswer: json['isItAnswer'] as bool,
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$$QuizAnswerCellImplToJson(
  _$QuizAnswerCellImpl instance,
) => <String, dynamic>{
  'answerId': instance.answerId,
  'questionId': instance.questionId,
  'data': instance.data,
  'isItAnswer': instance.isItAnswer,
  'position': instance.position,
};

_$QuizCorrectAnswerImpl _$$QuizCorrectAnswerImplFromJson(
  Map<String, dynamic> json,
) => _$QuizCorrectAnswerImpl(
  questionId: (json['questionId'] as num).toInt(),
  answerId:
      (json['answerId'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  answer: (json['answer'] as List<dynamic>).map((e) => e as String).toList(),
  explanation: json['explanation'] as String,
);

Map<String, dynamic> _$$QuizCorrectAnswerImplToJson(
  _$QuizCorrectAnswerImpl instance,
) => <String, dynamic>{
  'questionId': instance.questionId,
  'answerId': instance.answerId,
  'answer': instance.answer,
  'explanation': instance.explanation,
};
