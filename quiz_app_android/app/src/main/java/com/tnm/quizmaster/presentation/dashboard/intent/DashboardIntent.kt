package com.tnm.quizmaster.presentation.dashboard.intent

import com.tnm.quizmaster.domain.model.dashboard.DashboardData

sealed class DashboardIntent {
    object LoadDashboard : DashboardIntent()
    data class NavigateToQuizSets(val item: DashboardData.Item) : DashboardIntent()
}

sealed class DashboardNavEvent {
    data class NavigateToQuizSets(val item: DashboardData.Item) : DashboardNavEvent()
}