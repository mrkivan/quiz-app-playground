package com.tnm.shared.data.dto

import kotlinx.serialization.Serializable

@Serializable
data class DashboardDto(
    val total: Int,
    val items: List<ItemDto>
) {
    @Serializable
    data class ItemDto(
        val total: Int,
        val title: String,
        val topic: String,
        val description: String,
        val sections: List<SectionDto>,
        val sectionId: Int
    )

    @Serializable
    data class SectionDto(
        val title: String,
        val description: String,
        val position: Int,
        val fileName: String
    )
}
