package com.tnm.quizmaster.data.dto

data class DashboardDto(
    val total: Int,
    val items: List<ItemDto>
) {
    data class ItemDto(
        val total: Int,
        val title: String,
        val topic: String,
        val description: String,
        val sections: List<SectionDto>,
        val sectionId: Int
    )

    data class SectionDto(
        val title: String,
        val description: String,
        val position: Int,
        val fileName: String
    )
}


