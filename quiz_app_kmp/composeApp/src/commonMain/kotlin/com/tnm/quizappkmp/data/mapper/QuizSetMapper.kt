package com.tnm.quizappkmp.data.mapper

import com.tnm.quizappkmp.data.dto.DashboardDto
import com.tnm.quizappkmp.domain.model.quizSets.QuizSetData

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