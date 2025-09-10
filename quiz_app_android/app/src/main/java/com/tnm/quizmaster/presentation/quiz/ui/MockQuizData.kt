package com.tnm.quizmaster.presentation.quiz.ui

import com.tnm.quizmaster.domain.model.quiz.QuizData

val mockQuizData = QuizData(
    question = "Which Jetpack Compose library is used for Wear OS development?",
    answerCellType = 0,
    explanation = "The androidx.wear.compose library provides composables and utilities specifically designed for Wear OS development.",
    answerCellList = listOf(
        QuizData.AnswerCell(1, 1, "A. androidx.compose", false, 1),
        QuizData.AnswerCell(2, 1, "B. androidx.wear.compose", true, 2),
        QuizData.AnswerCell(3, 1, "C. androidx.appcompat", false, 3),
        QuizData.AnswerCell(4, 1, "D. androidx.constraintlayout", false, 4),
    ),
    correctAnswer = QuizData.CorrectAnswer(
        questionId = 1,
        answerId = listOf(2),
        answer = listOf("B. androidx.wear.compose"),
        explanation = "The androidx.wear.compose library provides composables and utilities specifically designed for Wear OS development."
    ),
    questionId = 1,
    selectedOptions = listOf(),
    answerSectionTitle = "",
)