import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({required int total, required List<DashboardDataItem> items}) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) => _$DashboardDataFromJson(json);
}

@freezed
class DashboardDataItem with _$DashboardDataItem {
  const factory DashboardDataItem({
    required int total,
    required String title,
    required String topic,
    required String description,
    required int sectionId,
    required List<DashboardDataSection> sections,
  }) = _DashboardDataItem;

  factory DashboardDataItem.fromJson(Map<String, dynamic> json) => _$DashboardDataItemFromJson(json);
}

@freezed
class DashboardDataSection with _$DashboardDataSection {
  const factory DashboardDataSection({
    required String title,
    required String description,
    required int position,
    required String fileName,
  }) = _DashboardDataSection;

  factory DashboardDataSection.fromJson(Map<String, dynamic> json) => _$DashboardDataSectionFromJson(json);
}
