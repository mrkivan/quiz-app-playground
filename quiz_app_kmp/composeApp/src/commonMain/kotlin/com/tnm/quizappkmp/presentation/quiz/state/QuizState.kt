package com.tnm.quizappkmp.presentation.quiz.state

data class QuizState(
    val selectedAnswers: List<Int> = emptyList(),
    val isSubmitted: Boolean = false,
    val showExplanation: Boolean = false,
    val isLastItem: Boolean = false,
    val currentQuestionNumber: Int = 0,
    val totalQuestions: Int = 0,
)