package com.tnm.quizappkmp.presentation.dashboard.route

import androidx.compose.runtime.Composable
import com.tnm.quizappkmp.presentation.dashboard.ui.DashboardScreen

@Composable
fun DashboardRoute(
    navigateToQuizSets: (quizTopic: String) -> Unit
) {

    DashboardScreen(
        navigateToQuizSets = navigateToQuizSets
    )
}