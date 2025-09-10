import Foundation

// MARK: - Dashboard Mapping

extension DashboardDTO {
    func toDomain() -> DashboardData {
        return DashboardData(
            total: total,
            items: items.map { $0.toDomain() }
        )
    }
}

extension DashboardDTO.ItemDTO {
    func toDomain() -> DashboardData.Item {
        return DashboardData.Item(
            total: total,
            title: title,
            topic: topic,
            description: description,
            sectionId: sectionId,
            sections: sections.map { $0.toDomain() }
        )
    }
}

extension DashboardDTO.SectionDTO {
    func toDomain() -> DashboardData.Section {
        return DashboardData.Section(
            title: title,
            description: description,
            position: position,
            fileName: fileName
        )
    }
}
