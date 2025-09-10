// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardDtoImpl _$$DashboardDtoImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDtoImpl(
      total: (json['total'] as num).toInt(),
      items:
          (json['items'] as List<dynamic>)
              .map((e) => ItemDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$DashboardDtoImplToJson(_$DashboardDtoImpl instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};

_$ItemDtoImpl _$$ItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$ItemDtoImpl(
      total: (json['total'] as num).toInt(),
      title: json['title'] as String,
      topic: json['topic'] as String,
      description: json['description'] as String,
      sections:
          (json['sections'] as List<dynamic>)
              .map((e) => SectionDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      sectionId: (json['sectionId'] as num).toInt(),
    );

Map<String, dynamic> _$$ItemDtoImplToJson(_$ItemDtoImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'title': instance.title,
      'topic': instance.topic,
      'description': instance.description,
      'sections': instance.sections,
      'sectionId': instance.sectionId,
    };

_$SectionDtoImpl _$$SectionDtoImplFromJson(Map<String, dynamic> json) =>
    _$SectionDtoImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      position: (json['position'] as num).toInt(),
      fileName: json['fileName'] as String,
    );

Map<String, dynamic> _$$SectionDtoImplToJson(_$SectionDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'position': instance.position,
      'fileName': instance.fileName,
    };
