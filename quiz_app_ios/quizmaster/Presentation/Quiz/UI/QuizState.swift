import Foundation

struct QuizState: Codable, Hashable {
    var selectedAnswers: [Int] = []
    var isSubmitted: Bool = false
    var showExplanation: Bool = false
    var isLastItem: Bool = false
    var currentQuestionNumber: Int = 0
    var totalQuestions: Int = 0
}
