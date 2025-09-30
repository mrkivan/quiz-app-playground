package com.tnm.quizappkmp.presentation.quiz.route

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import com.tnm.quizappkmp.presentation.quiz.ui.QuizScreen

@Composable
fun QuizRoute(
    navController: NavHostController,
    quizScreenData: QuizScreenData? = null,
    navigateToResult: (quizKey: String) -> Unit,
) {
    QuizScreen(
        navController = navController,
        quizScreenData = quizScreenData,
        navigateToResult = navigateToResult,
    )
}