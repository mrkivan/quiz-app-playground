import Foundation

struct QuizData: Codable {
    let questionId: Int
    let question: String
    let answerCellType: Int
    let selectedOptions: [Int]?
    let answerSectionTitle: String?
    let explanation: String
    let answerCellList: [AnswerCell]
    let correctAnswer: CorrectAnswer

    struct AnswerCell: Codable {
        let answerId: Int
        let questionId: Int
        let data: String
        let isItAnswer: Bool
        let position: Int
    }

    struct CorrectAnswer: Codable {
        let questionId: Int
        let answerId: [Int]
        let answer: [String]
        let explanation: String
    }
}
