package com.tnm.quizmaster

import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.tnm.quizmaster.QuizMasterDestinations.ARG_QUIZ_ID
import com.tnm.quizmaster.QuizMasterDestinations.ROUTE_HOME
import com.tnm.quizmaster.QuizMasterDestinations.ROUTE_QUIZ
import com.tnm.quizmaster.QuizMasterDestinations.ROUTE_QUIZ_SET
import com.tnm.quizmaster.QuizMasterDestinations.ROUTE_RESULT
import com.tnm.quizmaster.presentation.dashboard.route.DashboardRoute
import com.tnm.quizmaster.presentation.quiz.route.QuizRoute
import com.tnm.quizmaster.presentation.quiz.route.QuizScreenData
import com.tnm.quizmaster.presentation.quizSets.route.QuizSetRoute
import com.tnm.quizmaster.presentation.result.route.ResultRoute

object QuizMasterDestinations {
    const val ROUTE_HOME = "dashboard"
    const val ROUTE_QUIZ_SET = "quiz_list"
    const val ROUTE_QUIZ = "quiz"
    const val ROUTE_RESULT = "result"

    const val ARG_QUIZ_ID = "quizId"
}

object NavKeys {
    const val DATA_KEY_DASHBOARD = "dashboard_item"
    const val DATA_KEY_QUIZ = "quiz_data"
    const val DATA_KEY_RESULT = "result_key"
}

@Composable
fun AppNavHost(
    modifier: Modifier = Modifier,
    navController: NavHostController = rememberNavController(),
    startDestination: String = ROUTE_HOME,
) {

    NavHost(
        navController = navController,
        startDestination = startDestination,
        modifier = modifier,
    ) {
        composable(route = ROUTE_HOME) {
            DashboardRoute(navController)
        }
        composable(ROUTE_QUIZ_SET) {
            val quizTopic =
                navController.previousBackStackEntry?.savedStateHandle?.get<String>(NavKeys.DATA_KEY_DASHBOARD)

            QuizSetRoute(
                navController,
                quizTopic.orEmpty()
            )

        }
        composable(route = ROUTE_RESULT) {
            val resultKey =
                navController.previousBackStackEntry?.savedStateHandle?.get<String>(NavKeys.DATA_KEY_RESULT)

            ResultRoute(navController, resultKey.orEmpty())
        }
        composable(
            route = "$ROUTE_QUIZ/{$ARG_QUIZ_ID}",
            arguments = listOf(navArgument(ARG_QUIZ_ID) { type = NavType.IntType })
        ) { backStackEntry ->
            val quizScreenData =
                navController.previousBackStackEntry?.savedStateHandle?.get<QuizScreenData>(NavKeys.DATA_KEY_QUIZ)
            val quizId = backStackEntry.arguments?.getInt(ARG_QUIZ_ID) ?: -1
            if (quizScreenData != null) {
                QuizRoute(navController, quizScreenData, quizId)
            } else {
                Text("Error: Item not found")
            }

        }

    }
}