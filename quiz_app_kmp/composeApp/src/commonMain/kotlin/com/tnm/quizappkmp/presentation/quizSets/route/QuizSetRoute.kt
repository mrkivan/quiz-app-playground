package com.tnm.quizappkmp.presentation.quizSets.route

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import com.tnm.quizappkmp.QuizDestination
import com.tnm.quizappkmp.presentation.quizSets.ui.QuizSetScreen

@Composable
fun QuizSetRoute(
    navController: NavHostController,
    quizTopic: String,
    navigateToQuiz: (quizData: QuizDestination) -> Unit,
    navigateToResult: (quizKey: String) -> Unit,
) {
    QuizSetScreen(
        navController = navController,
        navigateToQuiz = navigateToQuiz,
        quizTopic = quizTopic,
        navigateToResult = navigateToResult
    )
}


