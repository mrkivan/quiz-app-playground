package com.tnm.quizmaster.presentation

import com.tnm.quizmaster.domain.model.dashboard.DashboardData
import com.tnm.quizmaster.domain.model.quiz.QuizData
import com.tnm.quizmaster.domain.model.quizset.QuizSetData
import com.tnm.quizmaster.domain.model.result.ResultData
import com.tnm.quizmaster.presentation.quiz.route.QuizScreenData

val mockDashboardData = DashboardData(
    total = 1, items = listOf(
        DashboardData.Item(
            total = 3,
            title = "Kotlin Fundamentals",
            description = "Covers basic to intermediate Kotlin concepts",
            sectionId = 101,
            topic = "Kotlin",
            sections = listOf(
                DashboardData.Section(
                    title = "Variables and Types",
                    description = "Learn about val, var, and Kotlin types",
                    position = 1,
                    fileName = "kotlin_section_1.json"
                ),
                DashboardData.Section(
                    title = "Control Flow",
                    description = "if, when, loops, and more",
                    position = 2,
                    fileName = "kotlin_section_2.json"
                ),
                DashboardData.Section(
                    title = "Functions and Lambdas",
                    description = "Declaring and using functions and lambdas",
                    position = 3,
                    fileName = "kotlin_section_3.json"
                )
            )
        )
    )
)
val mockQuizSetSectionItem = QuizSetData.SectionItem(
    title = "Kotlin Basics: Syntax and Variables",
    description = "Core Kotlin syntax and variable declarations",
    position = 22,
    fileName = "kotlin_1.json",
    previousResult = generateMockResultData()
)
val mockQuizSetData = QuizSetData(
    total = 1,
    title = "General Knowledge Quiz",
    topic = "General Knowledge",
    description = "A simple quiz to test your general knowledge.",
    sectionId = 1,
    sections = listOf(
        mockQuizSetSectionItem
    ),
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

val mockQuizData = QuizData(
    questionId = 1,
    question = "What is the capital of France?",
    answerCellType = 1,
    selectedOptions = null,
    answerSectionTitle = "Geography",
    explanation = "Paris is the capital city of France.",
    answerCellList = listOf(
        QuizData.AnswerCell(
            answerId = 1,
            questionId = 1,
            data = "Paris",
            isItAnswer = true,
            position = 1
        )
    ),
    correctAnswer = QuizData.CorrectAnswer(
        questionId = 1,
        answerId = listOf(1),
        answer = listOf("Paris"),
        explanation = "Paris is the capital city of France."
    )

)
val mockQuizScreenData = QuizScreenData(
    quizTitle = "General Knowledge Quiz",
    quizDescription = "A simple quiz to test your general knowledge.",
    quizSection = mockQuizSetSectionItem,
    currentQuizPosition = 1
)