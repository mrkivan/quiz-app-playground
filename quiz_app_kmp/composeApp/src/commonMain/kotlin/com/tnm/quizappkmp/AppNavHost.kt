package com.tnm.quizappkmp

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.toRoute
import com.tnm.quizappkmp.presentation.dashboard.route.DashboardRoute
import com.tnm.quizappkmp.presentation.quiz.route.QuizRoute
import com.tnm.quizappkmp.presentation.quiz.route.QuizScreenData
import com.tnm.quizappkmp.presentation.quizSets.route.QuizSetRoute
import com.tnm.quizappkmp.presentation.result.route.ResultRoute
import kotlinx.serialization.Serializable

@Serializable
object DashboardDestination

@Serializable
data class QuizSetDestination(val quizTopic: String)

@Serializable
data class QuizDestination(
    val quizTitle: String? = null,
    val quizDescription: String? = null,
    val fileName: String,
)

@Serializable
data class ResultDestination(val resultKey: String)


@Composable
fun AppNavHost() {
    val navController: NavHostController = rememberNavController()
    NavHost(navController = navController, startDestination = DashboardDestination) {

        composable<DashboardDestination> {
            DashboardRoute { quizTopic ->
                navController.navigate(QuizSetDestination(quizTopic))
            }
        }
        composable<QuizSetDestination> { backStackEntry ->
            QuizSetRoute(
                navController,
                quizTopic = backStackEntry.toRoute<QuizSetDestination>().quizTopic,
                navigateToQuiz = {
                    navController.navigate(it)
                },
                navigateToResult = {
                    navController.navigate(ResultDestination(it))
                }
            )

        }
        composable<ResultDestination> { backStackEntry ->
            ResultRoute(
                navController,
                key = backStackEntry.toRoute<ResultDestination>().resultKey,
            )
        }
        composable<QuizDestination> { backStackEntry ->
            val quizScreenData = QuizScreenData(
                quizTitle = backStackEntry.toRoute<QuizDestination>().quizTitle,
                quizDescription = backStackEntry.toRoute<QuizDestination>().quizDescription,
                fileName = backStackEntry.toRoute<QuizDestination>().fileName,
            )
            QuizRoute(
                navController,
                quizScreenData = quizScreenData,
            ) {
                navController.popBackStack()
                navController.navigate(ResultDestination(it))
            }
        }
    }
}