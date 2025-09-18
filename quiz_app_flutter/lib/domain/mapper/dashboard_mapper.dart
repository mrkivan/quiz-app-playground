import '../../data/model/dashboard/dashboard_dto.dart';
import '../entities/dashboard/dashboard_data.dart';

extension DashboardDtoX on DashboardDto {
  DashboardData toDomain() => DashboardData(total: total, items: items.map((e) => e.toDomain()).toList());
}

extension DashboardItemDtoX on ItemDto {
  DashboardDataItem toDomain() => DashboardDataItem(
    total: total,
    title: title,
    topic: topic,
    description: description,
    sectionId: sectionId,
    sections: sections.map((e) => e.toDomain()).toList(),
  );
}

extension DashboardSectionDtoX on SectionDto {
  DashboardDataSection toDomain() =>
      DashboardDataSection(title: title, description: description, position: position, fileName: fileName);
}
