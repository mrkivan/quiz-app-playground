import Foundation

struct ResultData: Codable, Hashable {
    let quizTitle: String?
    let quizDescription: String?
    let resultItems: [Item]
    let totalCorrectAnswers: Int
    let totalQuestions: Int
    let resultPercentage: Int

    struct Item: Codable, Hashable {
        let questionId: Int
        let question: String
        let result: Bool
        let answerSectionTitle: String?
        let correctAnswer: [String]
        let explanation: String
        let isSkipped: Bool
    }
}
