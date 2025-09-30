package com.tnm.quizappkmp.domain.model.result

import kotlinx.serialization.Serializable

@Serializable
data class ResultData(
    val quizTitle: String?,
    val quizDescription: String? = null,
    val resultItems: List<Item>,
    val totalCorrectAnswers: Int,
    val totalQuestions: Int,
    val resultPercentage: Int,
) {
    @Serializable
    data class Item(
        val questionId: Int,
        val question: String,
        val result: Boolean,
        val answerSectionTitle: String? = null,
        val correctAnswer: List<String>,
        val explanation: String,
        val isSkipped: Boolean = false
    )
}
