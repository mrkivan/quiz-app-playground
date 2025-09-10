package com.tnm.quizmaster.data.mapper

import com.tnm.quizmaster.data.dto.DashboardDto
import com.tnm.quizmaster.domain.model.quizset.QuizSetData


fun DashboardDto.ItemDto.toQuizSetDomain() = QuizSetData(
    total = total,
    title = title,
    topic = topic,
    description = description,
    sectionId = sectionId,
    sections = sections.map { it.toQuizSetDomain() }
)

fun DashboardDto.SectionDto.toQuizSetDomain() = QuizSetData.SectionItem(
    title = title,
    description = description,
    position = position,
    fileName = fileName,
)