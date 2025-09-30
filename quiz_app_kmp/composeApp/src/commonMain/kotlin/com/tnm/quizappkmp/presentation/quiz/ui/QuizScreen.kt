package com.tnm.quizappkmp.presentation.quiz.ui

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
import androidx.navigation.NavHostController
import com.tnm.quizappkmp.presentation.quiz.intent.QuizIntent
import com.tnm.quizappkmp.presentation.quiz.intent.QuizNavEvent
import com.tnm.quizappkmp.presentation.quiz.route.QuizScreenData
import com.tnm.quizappkmp.presentation.quiz.viewmodel.QuizViewModel
import com.tnm.quizappkmp.presentation.utils.ui.ConfirmDialog
import com.tnm.quizappkmp.presentation.utils.ui.PlaceholderScaffold
import com.tnm.quizappkmp.presentation.utils.ui.QuizAppToolbar
import com.tnm.quizappkmp.presentation.utils.ui.horizontalSlideTransition
import org.jetbrains.compose.resources.stringResource
import org.koin.compose.viewmodel.koinViewModel
import quiz_master_kmp.composeapp.generated.resources.Res
import quiz_master_kmp.composeapp.generated.resources.btn_confirm
import quiz_master_kmp.composeapp.generated.resources.dialog_exit_message
import quiz_master_kmp.composeapp.generated.resources.dialog_exit_title
import quiz_master_kmp.composeapp.generated.resources.label_back

@Composable
fun QuizScreen(
    navController: NavHostController,
    quizScreenData: QuizScreenData?,
    navigateToResult: (quizKey: String) -> Unit,
) {
    val viewModel: QuizViewModel = koinViewModel()
    fun navigateToNextQuestion() {
        viewModel.handleIntent(QuizIntent.NextQuestion)
    }

    fun loadData() {
        quizScreenData?.let {
            viewModel.handleIntent(QuizIntent.LoadQuiz(it))
        }
    }

    val uiState by viewModel.state.collectAsState()
    val quizState by viewModel.quizState.collectAsState()
    //val quizResultState by viewModel.quizResultState.collectAsState()

    val showExitConfirmationDialog = remember { mutableStateOf(false) }

    // Observe one-time events
    LaunchedEffect(Unit) {
        loadData()

        viewModel.navigationEvents.collect { event ->
            when (event) {
                is QuizNavEvent.NavigateToResult -> {
                    navigateToResult.invoke(event.key)
                }
            }
        }
    }

    // Exit dialog when navigate to back
    ConfirmDialog(
        title = stringResource(Res.string.dialog_exit_title),
        message = stringResource(Res.string.dialog_exit_message),
        onConfirm = {
            // Actually exit screen
            navController.popBackStack()
        },
        confirmButtonLabel = stringResource(Res.string.btn_confirm),
        showDialogState = showExitConfirmationDialog
    )

    PlaceholderScaffold(
        toolbarConfig = QuizAppToolbar(
            title = quizScreenData?.quizTitle.orEmpty(),
            navigationIcon = Icons.AutoMirrored.Filled.ArrowBack,
            navigationIconContentDescription = stringResource(Res.string.label_back),
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
    ) { data ->
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
            }
        }
    }
}