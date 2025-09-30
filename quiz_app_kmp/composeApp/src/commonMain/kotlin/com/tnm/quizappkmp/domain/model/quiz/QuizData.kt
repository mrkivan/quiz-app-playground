package com.tnm.quizappkmp.domain.model.quiz

import kotlinx.serialization.Serializable

@Serializable
data class QuizData(
    val questionId: Int,
    val question: String,
    val answerCellType: Int,
    val selectedOptions: List<Int>?,
    val answerSectionTitle: String?,
    val explanation: String,
    val answerCellList: List<AnswerCell>,
    val correctAnswer: CorrectAnswer
) {
    @Serializable
    data class AnswerCell(
        val answerId: Int,
        val questionId: Int,
        val data: String,
        val isItAnswer: Boolean,
        val position: Int
    )

    @Serializable
    data class CorrectAnswer(
        val questionId: Int,
        val answerId: List<Int>,
        val answer: List<String>,
        val explanation: String
    )
}

