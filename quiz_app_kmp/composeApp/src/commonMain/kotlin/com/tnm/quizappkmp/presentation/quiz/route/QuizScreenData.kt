package com.tnm.quizappkmp.presentation.quiz.route

import kotlinx.serialization.Serializable

@Serializable
data class QuizScreenData(
    val quizTitle: String? = null,
    val quizDescription: String? = null,
    val currentQuizPosition: Int = -1,
    val fileName: String,
)