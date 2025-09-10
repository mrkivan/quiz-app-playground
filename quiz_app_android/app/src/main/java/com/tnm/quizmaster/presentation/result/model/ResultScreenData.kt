package com.tnm.quizmaster.presentation.result.model

import android.os.Parcelable
import com.tnm.quizmaster.domain.model.result.ResultData
import kotlinx.parcelize.Parcelize

@Parcelize
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
) : Parcelable