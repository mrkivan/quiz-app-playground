import '../../data/model/dashboard/dashboard_dto.dart';
import '../entities/quiz_set/quiz_set_data.dart';

extension DashboardItemDtoMapper on ItemDto {
  QuizSetData toQuizSetDomain() {
    return QuizSetData(
      total: total,
      title: title,
      topic: topic,
      description: description,
      sectionId: sectionId,
      sections: sections.map((e) => e.toQuizSetDomain()).toList(),
    );
  }
}

extension DashboardSectionDtoMapper on SectionDto {
  QuizSetItem toQuizSetDomain() {
    return QuizSetItem(title: title, description: description, position: position, fileName: fileName);
  }
}
