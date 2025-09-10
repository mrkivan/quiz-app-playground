struct ResultScreenData: Codable, Hashable {
    let quizTitle: String?
    let quizDescription: String?

    let correctItems: [ResultData.Item]
    let skippedItems: [ResultData.Item]
    let incorrectItems: [ResultData.Item]

    let totalCorrectItems: Int
    let totalSkippedItems: Int
    let totalInCorrectItems: Int

    let totalQuestions: Int
    let resultPercentage: Int
}
