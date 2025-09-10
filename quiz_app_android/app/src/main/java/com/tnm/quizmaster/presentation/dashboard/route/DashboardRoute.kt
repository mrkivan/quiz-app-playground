package com.tnm.quizmaster.presentation.dashboard.route

import androidx.compose.runtime.Composable
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.tnm.quizmaster.presentation.dashboard.ui.DashboardScreen
import com.tnm.quizmaster.presentation.dashboard.viewmodel.DashboardViewModel

@Composable
fun DashboardRoute(
    navController: NavHostController,
    viewModel: DashboardViewModel = hiltViewModel()
) {

    DashboardScreen(
        viewModel = viewModel,
        navController = navController
    )
}