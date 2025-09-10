import Foundation

// MARK: - QuizSet Mapping

extension DashboardDTO.ItemDTO {
    func toQuizSetDomain() -> QuizSetData {
        return QuizSetData(
            total: total,
            title: title,
            topic: topic,
            description: description,
            sectionId: sectionId,
            sections: sections.map { $0.toQuizSetDomain() }
        )
    }
}

extension DashboardDTO.SectionDTO {
    func toQuizSetDomain() -> QuizSetData.SectionItem {
        return QuizSetData.SectionItem(
            title: title,
            description: description,
            position: position,
            fileName: fileName
        )
    }
}
