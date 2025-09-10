// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_set_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizSetDataImpl _$$QuizSetDataImplFromJson(Map<String, dynamic> json) =>
    _$QuizSetDataImpl(
      total: (json['total'] as num).toInt(),
      title: json['title'] as String,
      topic: json['topic'] as String,
      description: json['description'] as String,
      sectionId: (json['sectionId'] as num).toInt(),
      sections:
          (json['sections'] as List<dynamic>)
              .map((e) => QuizSetItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$QuizSetDataImplToJson(_$QuizSetDataImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'title': instance.title,
      'topic': instance.topic,
      'description': instance.description,
      'sectionId': instance.sectionId,
      'sections': instance.sections,
    };

_$QuizSetItemImpl _$$QuizSetItemImplFromJson(Map<String, dynamic> json) =>
    _$QuizSetItemImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      position: (json['position'] as num).toInt(),
      fileName: json['fileName'] as String,
      previousResult:
          json['previousResult'] == null
              ? null
              : ResultData.fromJson(
                json['previousResult'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$$QuizSetItemImplToJson(_$QuizSetItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'position': instance.position,
      'fileName': instance.fileName,
      'previousResult': instance.previousResult,
    };
