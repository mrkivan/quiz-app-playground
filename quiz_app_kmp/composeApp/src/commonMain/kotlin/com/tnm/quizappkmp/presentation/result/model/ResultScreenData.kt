package com.tnm.quizappkmp.presentation.result.model

import com.tnm.quizappkmp.domain.model.result.ResultData
import kotlinx.serialization.Serializable

@Serializable
data class ResultScreenData(
    val quizTitle: String?,
    val quizDescription: String? = null,

    val correctItems: List<ResultData.Item>,
    val skippedItems: List<ResultData.Item>,
    val incorrectItems: List<ResultData.Item>,

    val totalCorrectItems: Int,
    val totalSkippedItems: Int,
    val totalInCorrectItems: Int,

    val totalQuestions: Int,
    val resultPercentage: Int,
)