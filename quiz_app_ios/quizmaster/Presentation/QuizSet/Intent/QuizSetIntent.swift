// MARK: - QuizSetIntent
enum QuizSetIntent {
    case loadQuizSet(quizTopic: String?)
    case navigateToQuiz(data: QuizSetData.SectionItem)
}

// MARK: - QuizSetNavEvent
enum QuizSetNavEvent {
    case navigateToQuiz(data: QuizScreenData)
}
