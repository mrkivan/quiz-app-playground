package com.tnm.shared.presentation.dashboard.intent

import com.tnm.quizappkmp.domain.DashboardData

sealed class DashboardIntent {
    object LoadDashboard : DashboardIntent()
    data class NavigateToQuizSets(val item: DashboardData.Item) : DashboardIntent()
}

sealed class DashboardNavEvent {
    data class NavigateToQuizSets(val item: DashboardData.Item) : DashboardNavEvent()
}