import Foundation

// MARK: - Quiz Intent
enum QuizIntent {
    case loadQuiz(data: QuizScreenData)
    case submitAnswer
    case skipQuestion
    case nextQuestion
    case updateSelectedAnswers(answers: [Int])
    case navigateToResult
}

// MARK: - Quiz Navigation Event
enum QuizNavEvent {
    case navigateToResult(key: String)
}
