package com.tnm.quizappkmp.data.dto

import kotlinx.serialization.Serializable

@Serializable
data class QuizListDto(
    val total: Int,
    val items: List<QuizItemDto>
) {
    @Serializable
    data class QuizItemDto(
        val questionId: Int,
        val question: String,
        val answerCellType: Int,
        val selectedOptions: List<Int>? = null,
        val answerSectionTitle: String? = null,
        val explanation: String,
        val answerCellList: List<AnswerCellDto>,
        val correctAnswer: CorrectAnswerDto
    )

    @Serializable
    data class AnswerCellDto(
        val answerId: Int,
        val questionId: Int,
        val data: String,
        val isItAnswer: Boolean,
        val position: Int
    )

    @Serializable
    data class CorrectAnswerDto(
        val questionId: Int,
        val answerId: List<Int>,
        val answer: List<String>,
        val explanation: String
    )
}
