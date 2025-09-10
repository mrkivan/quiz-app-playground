package com.tnm.quizmaster.data.mapper

import com.tnm.quizmaster.data.dto.DashboardDto
import com.tnm.quizmaster.domain.model.dashboard.DashboardData

fun DashboardDto.toDomain() = DashboardData(
    total = total,
    items = items.map { it.toDomain() }
)

fun DashboardDto.ItemDto.toDomain() = DashboardData.Item(
    total = total,
    title = title,
    topic = topic,
    description = description,
    sectionId = sectionId,
    sections = sections.map { it.toDomain() }
)

fun DashboardDto.SectionDto.toDomain() = DashboardData.Section(
    title = title,
    description = description,
    position = position,
    fileName = fileName
)