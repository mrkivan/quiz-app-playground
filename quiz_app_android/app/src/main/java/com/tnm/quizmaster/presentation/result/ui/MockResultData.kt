package com.tnm.quizmaster.presentation.result.ui

import com.tnm.quizmaster.domain.model.result.ResultData
import com.tnm.quizmaster.presentation.result.model.ResultScreenData

fun getMockResultScreenItem(
    result: Boolean = false,
    correctAnswer: List<String> = emptyList()
): ResultData.Item {
    return ResultData.Item(
        questionId = 1,
        question = "What is the capital of France?",
        answerSectionTitle = "Correct Answer",
        correctAnswer = correctAnswer,
        explanation = "Paris is the capital and largest city of France.",
        result = result
    )
}

fun getMockResultData(): ResultScreenData {
    return ResultScreenData(
        quizTitle = "General Knowledge Quiz",
        quizDescription = "This is a sample quiz description.",
        correctItems = listOf(
            ResultData.Item(
                questionId = 1,
                question = "What is the capital of France?",
                answerSectionTitle = "Correct Answer",
                correctAnswer = listOf("Paris"),
                explanation = "Paris is the capital and largest city of France.",
                result = true
            )
        ),
        incorrectItems = listOf(
            ResultData.Item(
                questionId = 2,
                question = "What is 2 + 2?",
                answerSectionTitle = "Correct Answer",
                correctAnswer = listOf("4"),
                explanation = "Basic arithmetic: 2 + 2 equals 4.",
                result = false
            )
        ),
        skippedItems = emptyList(),
        totalCorrectItems = 1,
        totalSkippedItems = 0,
        totalInCorrectItems = 1,
        totalQuestions = 1,
        resultPercentage = 50
    )
}