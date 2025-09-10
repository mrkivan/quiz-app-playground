package com.tnm.quizmaster.domain.model.dashboard

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class DashboardData(
    val total: Int,
    val items: List<Item>
) : Parcelable {
    @Parcelize
    data class Item(
        val total: Int,
        val title: String,
        val topic: String,
        val description: String,
        val sectionId: Int,
        val sections: List<Section>
    ) : Parcelable

    @Parcelize
    data class Section(
        val title: String,
        val description: String,
        val position: Int,
        val fileName: String
    ) : Parcelable
}
