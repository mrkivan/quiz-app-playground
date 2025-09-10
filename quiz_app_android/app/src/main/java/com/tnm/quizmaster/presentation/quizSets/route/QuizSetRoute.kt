package com.tnm.quizmaster.presentation.quizSets.route

import androidx.compose.runtime.Composable
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.tnm.quizmaster.presentation.quizSets.ui.QuizSetScreen
import com.tnm.quizmaster.presentation.quizSets.viewmodel.QuizSetViewModel

@Composable
fun QuizSetRoute(
    navController: NavHostController,
    quizTopic: String,
    viewModel: QuizSetViewModel = hiltViewModel()
) {
    QuizSetScreen(
        viewModel = viewModel,
        navController = navController,
        quizTopic = quizTopic
    )
}


