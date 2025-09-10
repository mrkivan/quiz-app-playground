package com.tnm.quizmaster.domain.model.quizset

import android.os.Parcelable
import com.tnm.quizmaster.domain.model.result.ResultData
import kotlinx.parcelize.Parcelize

@Parcelize
data class QuizSetData(
    val total: Int,
    val title: String,
    val topic: String,
    val description: String,
    val sectionId: Int,
    val sections: List<SectionItem>
) : Parcelable {
    @Parcelize
    data class SectionItem(
        val title: String,
        val description: String,
        val position: Int,
        val fileName: String,
        var previousResult: ResultData? = null
    ) : Parcelable
}