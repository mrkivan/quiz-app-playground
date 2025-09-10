import Foundation

struct QuizScreenData: Codable, Hashable {
    var quizTitle: String? = nil
    var quizDescription: String? = nil
    var quizSection: QuizSetData.SectionItem? = nil
    var currentQuizPosition: Int = -1
}
