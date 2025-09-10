package com.tnm.quizmaster.domain.model.quiz

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class QuizData(
    val questionId: Int,
    val question: String,
    val answerCellType: Int,
    val selectedOptions: List<Int>?,
    val answerSectionTitle: String?,
    val explanation: String,
    val answerCellList: List<AnswerCell>,
    val correctAnswer: CorrectAnswer
) : Parcelable {
    @Parcelize
    data class AnswerCell(
        val answerId: Int,
        val questionId: Int,
        val data: String,
        val isItAnswer: Boolean,
        val position: Int
    ) : Parcelable

    @Parcelize
    data class CorrectAnswer(
        val questionId: Int,
        val answerId: List<Int>,
        val answer: List<String>,
        val explanation: String
    ) : Parcelable
}

