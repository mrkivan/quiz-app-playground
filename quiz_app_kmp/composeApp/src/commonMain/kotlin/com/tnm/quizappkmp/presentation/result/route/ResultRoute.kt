package com.tnm.quizappkmp.presentation.result.route

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import com.tnm.quizappkmp.presentation.result.ui.ResultScreen

@Composable
fun ResultRoute(
    navController: NavHostController,
    key: String,
) {
    ResultScreen(
        key = key,
        navController = navController,
    )
}