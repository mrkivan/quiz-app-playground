// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardDataImpl _$$DashboardDataImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDataImpl(
      total: (json['total'] as num).toInt(),
      items:
          (json['items'] as List<dynamic>)
              .map((e) => DashboardDataItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$DashboardDataImplToJson(_$DashboardDataImpl instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};

_$DashboardDataItemImpl _$$DashboardDataItemImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardDataItemImpl(
  total: (json['total'] as num).toInt(),
  title: json['title'] as String,
  topic: json['topic'] as String,
  description: json['description'] as String,
  sectionId: (json['sectionId'] as num).toInt(),
  sections:
      (json['sections'] as List<dynamic>)
          .map((e) => DashboardDataSection.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$DashboardDataItemImplToJson(
  _$DashboardDataItemImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'title': instance.title,
  'topic': instance.topic,
  'description': instance.description,
  'sectionId': instance.sectionId,
  'sections': instance.sections,
};

_$DashboardDataSectionImpl _$$DashboardDataSectionImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardDataSectionImpl(
  title: json['title'] as String,
  description: json['description'] as String,
  position: (json['position'] as num).toInt(),
  fileName: json['fileName'] as String,
);

Map<String, dynamic> _$$DashboardDataSectionImplToJson(
  _$DashboardDataSectionImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'position': instance.position,
  'fileName': instance.fileName,
};
