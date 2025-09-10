// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultDataImpl _$$ResultDataImplFromJson(Map<String, dynamic> json) =>
    _$ResultDataImpl(
      quizTitle: json['quizTitle'] as String?,
      quizDescription: json['quizDescription'] as String?,
      resultItems:
          (json['resultItems'] as List<dynamic>)
              .map((e) => ResultItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      totalCorrectAnswers: (json['totalCorrectAnswers'] as num).toInt(),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
      resultPercentage: (json['resultPercentage'] as num).toInt(),
    );

Map<String, dynamic> _$$ResultDataImplToJson(_$ResultDataImpl instance) =>
    <String, dynamic>{
      'quizTitle': instance.quizTitle,
      'quizDescription': instance.quizDescription,
      'resultItems': instance.resultItems,
      'totalCorrectAnswers': instance.totalCorrectAnswers,
      'totalQuestions': instance.totalQuestions,
      'resultPercentage': instance.resultPercentage,
    };

_$ResultItemImpl _$$ResultItemImplFromJson(Map<String, dynamic> json) =>
    _$ResultItemImpl(
      questionId: (json['questionId'] as num).toInt(),
      question: json['question'] as String,
      result: json['result'] as bool,
      answerSectionTitle: json['answerSectionTitle'] as String?,
      correctAnswer:
          (json['correctAnswer'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      explanation: json['explanation'] as String,
      isSkipped: json['isSkipped'] as bool? ?? false,
    );

Map<String, dynamic> _$$ResultItemImplToJson(_$ResultItemImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'question': instance.question,
      'result': instance.result,
      'answerSectionTitle': instance.answerSectionTitle,
      'correctAnswer': instance.correctAnswer,
      'explanation': instance.explanation,
      'isSkipped': instance.isSkipped,
    };
