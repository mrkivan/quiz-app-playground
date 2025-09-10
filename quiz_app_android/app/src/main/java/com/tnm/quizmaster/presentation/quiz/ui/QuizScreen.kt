package com.tnm.quizmaster.presentation.quiz.ui

import androidx.compose.animation.AnimatedContent
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.navigation.NavHostController
import com.tnm.quizmaster.NavKeys
import com.tnm.quizmaster.QuizMasterDestinations
import com.tnm.quizmaster.R
import com.tnm.quizmaster.presentation.quiz.intent.QuizIntent
import com.tnm.quizmaster.presentation.quiz.intent.QuizNavEvent
import com.tnm.quizmaster.presentation.quiz.route.QuizScreenData
import com.tnm.quizmaster.presentation.quiz.ui.animation.QuizOverlayAnimation
import com.tnm.quizmaster.presentation.quiz.viewmodel.QuizViewModel
import com.tnm.quizmaster.presentation.utils.ui.ConfirmDialog
import com.tnm.quizmaster.presentation.utils.ui.PlaceholderScaffold
import com.tnm.quizmaster.presentation.utils.ui.QuizAppToolbar
import com.tnm.quizmaster.presentation.utils.ui.horizontalSlideTransition

@Composable
fun QuizScreen(
    viewModel: QuizViewModel,
    quizScreenData: QuizScreenData?,
    quizId: Int,
    navController: NavHostController
) {
    fun navigateToNextQuestion() {
        val quizId = viewModel.getQuizId()

        navController.navigate(QuizMasterDestinations.ROUTE_QUIZ + "/$quizId") {
            launchSingleTop = true
        }
    }

    fun loadData() {
        quizScreenData?.let {
            viewModel.handleIntent(QuizIntent.LoadQuiz(it))
        }
    }

    val uiState by viewModel.state.collectAsState()
    val quizState by viewModel.quizState.collectAsState()
    val quizResultState by viewModel.quizResultState.collectAsState()

    val showExitConfirmationDialog = remember { mutableStateOf(false) }

    LaunchedEffect(quizId) {
        if (quizId > 0) {
            viewModel.handleIntent(QuizIntent.NextQuestion)
        }
    }

    // Observe one-time events
    LaunchedEffect(Unit) {
        loadData()

        viewModel.navigationEvents.collect { event ->
            when (event) {
                is QuizNavEvent.NavigateToResult -> {
                    navController.popBackStack()
                    navController.currentBackStackEntry?.savedStateHandle?.set(
                        NavKeys.DATA_KEY_RESULT,
                        event.key
                    )
                    navController.navigate(QuizMasterDestinations.ROUTE_RESULT)
                }
            }
        }
    }

    // Exit dialog when navigate to back
    ConfirmDialog(
        title = stringResource(R.string.dialog_exit_title),
        message = stringResource(R.string.dialog_exit_message),
        onConfirm = {
            // Actually exit screen
            navController.popBackStack()
        },
        confirmButtonLabel = stringResource(R.string.btn_confirm),
        showDialogState = showExitConfirmationDialog
    )

    PlaceholderScaffold(
        toolbarConfig = QuizAppToolbar(
            title = quizScreenData?.quizSection?.title.orEmpty(),
            navigationIcon = Icons.AutoMirrored.Filled.ArrowBack,
            navigationIconContentDescription = stringResource(R.string.label_back),
            onNavigationClick = {
                showExitConfirmationDialog.value = viewModel.showExitConfirmationDialog()
                if (!showExitConfirmationDialog.value) navController.navigateUp()
            },
        ),
        uiState = uiState,
        modifier = Modifier,
        onRetryClicked = {
            loadData()
        }
    ) { paddingValues, data ->
        AnimatedContent(
            targetState = data,
            transitionSpec = horizontalSlideTransition(),
            label = "quiz-slide"
        ) { data ->
            Box(modifier = Modifier.fillMaxSize()) {
                QuizBody(
                    quizData = data,
                    quizState = quizState,
                    updateSelectedAnswers = { answers ->
                        viewModel.handleIntent(QuizIntent.UpdateSelectedAnswers(answers))
                    },
                    submitAnswer = {
                        viewModel.handleIntent(QuizIntent.SubmitAnswer)
                    },
                    skipQuestion = {
                        navigateToNextQuestion()
                    },
                    moveToNextQuestion = {
                        navigateToNextQuestion()
                    },
                    navigateToResultScreen = {
                        viewModel.handleIntent(QuizIntent.NavigateToResult)
                    }
                )
                // Overlay animations
                QuizOverlayAnimation(
                    resultState = quizResultState,
                    onAnimationEnd = {
                        // do nothing now, maybe for future
                    }
                )
            }
        }
    }
}