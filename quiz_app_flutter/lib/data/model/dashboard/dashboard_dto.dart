import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_dto.freezed.dart';
part 'dashboard_dto.g.dart';

@freezed
class SectionDto with _$SectionDto {
  const factory SectionDto({
    required String title,
    required String description,
    required int position,
    required String fileName,
  }) = _SectionDto;

  factory SectionDto.fromJson(Map<String, dynamic> json) => _$SectionDtoFromJson(json);
}

@freezed
class ItemDto with _$ItemDto {
  const factory ItemDto({
    required int total,
    required String title,
    required String topic,
    required String description,
    required List<SectionDto> sections,
    required int sectionId,
  }) = _ItemDto;

  factory ItemDto.fromJson(Map<String, dynamic> json) => _$ItemDtoFromJson(json);
}

@freezed
class DashboardDto with _$DashboardDto {
  const factory DashboardDto({required int total, required List<ItemDto> items}) = _DashboardDto;

  factory DashboardDto.fromJson(Map<String, dynamic> json) => _$DashboardDtoFromJson(json);
}
