// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_screen_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizScreenDataImpl _$$QuizScreenDataImplFromJson(Map<String, dynamic> json) =>
    _$QuizScreenDataImpl(
      quizTitle: json['quizTitle'] as String?,
      quizDescription: json['quizDescription'] as String?,
      quizSection:
          json['quizSection'] == null
              ? null
              : QuizSetItem.fromJson(
                json['quizSection'] as Map<String, dynamic>,
              ),
      currentQuizPosition: (json['currentQuizPosition'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$QuizScreenDataImplToJson(
  _$QuizScreenDataImpl instance,
) => <String, dynamic>{
  'quizTitle': instance.quizTitle,
  'quizDescription': instance.quizDescription,
  'quizSection': instance.quizSection,
  'currentQuizPosition': instance.currentQuizPosition,
};
