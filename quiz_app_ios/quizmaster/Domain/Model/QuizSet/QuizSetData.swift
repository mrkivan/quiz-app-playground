import Foundation

struct QuizSetData: Codable, Hashable {
    let total: Int
    let title: String
    let topic: String
    let description: String
    let sectionId: Int
    let sections: [SectionItem]

    struct SectionItem: Codable, Hashable {
        let title: String
        let description: String
        let position: Int
        let fileName: String
        var previousResult: ResultData? = nil
    }
}
