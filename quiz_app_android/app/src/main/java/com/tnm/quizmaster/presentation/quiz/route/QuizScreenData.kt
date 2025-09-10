package com.tnm.quizmaster.presentation.quiz.route

import android.os.Parcelable
import com.tnm.quizmaster.domain.model.quizset.QuizSetData
import kotlinx.parcelize.Parcelize

@Parcelize
data class QuizScreenData(
    val quizTitle: String? = null,
    val quizDescription: String? = null,
    val quizSection: QuizSetData.SectionItem? = null,
    val currentQuizPosition: Int = -1,
) : Parcelable