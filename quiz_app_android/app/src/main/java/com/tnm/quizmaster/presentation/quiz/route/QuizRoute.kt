package com.tnm.quizmaster.presentation.quiz.route

import androidx.compose.runtime.Composable
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.tnm.quizmaster.presentation.quiz.ui.QuizScreen
import com.tnm.quizmaster.presentation.quiz.viewmodel.QuizViewModel

@Composable
fun QuizRoute(
    navController: NavHostController,
    quizScreenData: QuizScreenData? = null,
    quizId: Int,
    viewModel: QuizViewModel = hiltViewModel()
) {

    QuizScreen(
        viewModel = viewModel,
        quizScreenData = quizScreenData,
        quizId = quizId,
        navController = navController,
    )
}