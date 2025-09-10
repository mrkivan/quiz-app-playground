package com.tnm.quizmaster.presentation.quizSets.ui

import com.tnm.quizmaster.domain.model.quizset.QuizSetData
import com.tnm.quizmaster.domain.model.result.ResultData


fun getMockQuizSetData() = QuizSetData.SectionItem(
    title = "Kotlin Basics: Syntax and Variables for testing long long title",
    description = "Core Kotlin syntax and variable declarations  for testing long long long long long description.",
    position = 22,
    fileName = "",
)

fun generateMockResultData(): ResultData {
    val mockItems = listOf(
        ResultData.Item(
            questionId = 1,
            question = "What is the capital of France?",
            result = true,
            answerSectionTitle = "Geography",
            correctAnswer = listOf("Paris"),
            explanation = "Paris is the capital city of France.",
            isSkipped = false
        ),
        ResultData.Item(
            questionId = 2,
            question = "Which planet is known as the Red Planet?",
            result = false,
            answerSectionTitle = "Science",
            correctAnswer = listOf("Mars"),
            explanation = "Mars is called the Red Planet due to its reddish appearance.",
            isSkipped = false
        ),
        ResultData.Item(
            questionId = 3,
            question = "Which language is primarily used for Android development?",
            result = true,
            answerSectionTitle = "Programming",
            correctAnswer = listOf("Kotlin"),
            explanation = "Kotlin is now the preferred language for Android development.",
            isSkipped = false
        ),
        ResultData.Item(
            questionId = 4,
            question = "Who wrote 'Hamlet'?",
            result = true,
            answerSectionTitle = "Literature",
            correctAnswer = listOf("William Shakespeare"),
            explanation = "'Hamlet' is a tragedy written by William Shakespeare.",
            isSkipped = false
        ),
        ResultData.Item(
            questionId = 5,
            question = "What is 2 + 2?",
            result = true,
            answerSectionTitle = "Mathematics",
            correctAnswer = listOf("4"),
            explanation = "2 + 2 equals 4.",
            isSkipped = false
        )
    )

    val totalCorrect = mockItems.count { it.result }
    val totalQuestions = mockItems.size
    val percentage = (totalCorrect * 100 / totalQuestions)

    return ResultData(
        quizTitle = "General Knowledge Quiz",
        quizDescription = "A simple quiz to test your general knowledge.",
        resultItems = mockItems,
        totalCorrectAnswers = totalCorrect,
        totalQuestions = totalQuestions,
        resultPercentage = percentage
    )
}
