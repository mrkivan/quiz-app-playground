import Foundation

struct DashboardData: Codable {
    let total: Int
    let items: [Item]

    struct Item: Codable {
        let total: Int
        let title: String
        let topic: String
        let description: String
        let sectionId: Int
        let sections: [Section]
    }

    struct Section: Codable {
        let title: String
        let description: String
        let position: Int
        let fileName: String
    }
}
