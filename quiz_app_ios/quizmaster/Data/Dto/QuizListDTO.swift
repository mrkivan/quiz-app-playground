import Foundation

struct QuizListDTO: Codable {
    let total: Int
    let items: [QuizItemDTO]

    struct QuizItemDTO: Codable {
        let questionId: Int
        let question: String
        let answerCellType: Int
        let selectedOptions: [Int]?  // nullable
        let answerSectionTitle: String?  // optional
        let explanation: String
        let answerCellList: [AnswerCellDTO]
        let correctAnswer: CorrectAnswerDTO
    }

    struct AnswerCellDTO: Codable {
        let answerId: Int
        let questionId: Int
        let data: String
        let isItAnswer: Bool
        let position: Int
    }

    struct CorrectAnswerDTO: Codable {
        let questionId: Int
        let answerId: [Int]
        let answer: [String]
        let explanation: String
    }
}
