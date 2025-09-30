package com.tnm.quizappkmp.domain.model.quizSets

import com.tnm.quizappkmp.domain.model.result.ResultData
import kotlinx.serialization.Serializable

@Serializable
data class QuizSetData(
    val total: Int,
    val title: String,
    val topic: String,
    val description: String,
    val sectionId: Int,
    val sections: List<SectionItem>
) {
    @Serializable
    data class SectionItem(
        val title: String,
        val description: String,
        val position: Int,
        val fileName: String,
        var previousResult: ResultData? = null
    )
}