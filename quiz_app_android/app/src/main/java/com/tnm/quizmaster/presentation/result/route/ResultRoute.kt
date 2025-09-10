package com.tnm.quizmaster.presentation.result.route

import androidx.compose.runtime.Composable
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.tnm.quizmaster.presentation.result.ui.ResultScreen
import com.tnm.quizmaster.presentation.result.viewmodel.ResultViewModel

@Composable
fun ResultRoute(
    navController: NavHostController,
    key: String,
    viewModel: ResultViewModel = hiltViewModel()
) {
    ResultScreen(
        viewModel = viewModel,
        key = key,
        navController = navController,
    )
}