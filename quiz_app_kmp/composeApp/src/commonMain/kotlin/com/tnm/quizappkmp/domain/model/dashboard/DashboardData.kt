package com.tnm.quizappkmp.domain.model.dashboard

import kotlinx.serialization.Serializable

@Serializable
data class DashboardData(
    val total: Int,
    val items: List<Item>
) {
    @Serializable
    data class Item(
        val total: Int,
        val title: String,
        val topic: String,
        val description: String,
        val sectionId: Int,
        val sections: List<Section>
    )

    @Serializable
    data class Section(
        val title: String,
        val description: String,
        val position: Int,
        val fileName: String
    )
}