package com.tnm.quizmaster.presentation.dashboard.ui

import com.tnm.quizmaster.domain.model.dashboard.DashboardData


val mockDashboardItem = DashboardData.Item(
    total = 3,
    title = "Kotlin Fundamentals",
    description = "Covers basic to intermediate Kotlin concepts",
    sectionId = 101,
    topic = "Kotlin",
    sections = listOf(
        DashboardData.Section(
            title = "Variables and Types",
            description = "Learn about val, var, and Kotlin types",
            position = 1,
            fileName = "kotlin_section_1.json"
        ),
        DashboardData.Section(
            title = "Control Flow",
            description = "if, when, loops, and more",
            position = 2,
            fileName = "kotlin_section_2.json"
        ),
        DashboardData.Section(
            title = "Functions and Lambdas",
            description = "Declaring and using functions and lambdas",
            position = 3,
            fileName = "kotlin_section_3.json"
        )
    )
)
