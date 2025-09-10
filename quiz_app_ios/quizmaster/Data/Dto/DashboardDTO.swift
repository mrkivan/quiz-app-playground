import Foundation

struct DashboardDTO: Codable {
    let total: Int
    let items: [ItemDTO]

    struct ItemDTO: Codable {
        let total: Int
        let title: String
        let topic: String
        let description: String
        let sections: [SectionDTO]
        let sectionId: Int
    }

    struct SectionDTO: Codable {
        let title: String
        let description: String
        let position: Int
        let fileName: String
    }
}
