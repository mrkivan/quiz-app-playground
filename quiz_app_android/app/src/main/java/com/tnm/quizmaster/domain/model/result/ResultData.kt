package com.tnm.quizmaster.domain.model.result

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class ResultData(
    val quizTitle: String?,
    val quizDescription: String? = null,
    val resultItems: List<Item>,
    val totalCorrectAnswers: Int,
    val totalQuestions: Int,
    val resultPercentage: Int,
) : Parcelable {
    @Parcelize
    data class Item(
        val questionId: Int,
        val question: String,
        val result: Boolean,
        val answerSectionTitle: String? = null,
        val correctAnswer: List<String>,
        val explanation: String,
        val isSkipped: Boolean = false
    ) : Parcelable

}
