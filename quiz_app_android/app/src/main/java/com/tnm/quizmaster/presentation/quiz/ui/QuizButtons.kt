package com.tnm.quizmaster.presentation.quiz.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.tnm.quizmaster.R
import com.tnm.quizmaster.presentation.quiz.state.QuizState
import com.tnm.quizmaster.presentation.utils.ui.ConfirmDialog
import com.tnm.quizmaster.presentation.utils.ui.SpacerLargeWidth

@Composable
fun QuizButtons(
    quizState: QuizState,
    submitAnswer: () -> Unit,
    skipQuestion: () -> Unit,
    moveToNextQuestion: () -> Unit,
    navigateToResultScreen: () -> Unit,
) {
    val showSkipDialog = remember { mutableStateOf(false) }
    val showSubmitConfirmationDialog = remember { mutableStateOf(false) }
    ConfirmDialog(
        title = stringResource(R.string.dialog_submit_title),
        message = stringResource(R.string.dialog_submit_message),
        onConfirm = {
            submitAnswer()
        },
        confirmButtonLabel = stringResource(R.string.btn_confirm),
        showDialogState = showSubmitConfirmationDialog
    )

    ConfirmDialog(
        title = stringResource(R.string.dialog_skip_title),
        message = stringResource(R.string.dialog_skip_message),
        confirmButtonLabel = stringResource(R.string.btn_skip),
        onConfirm = {
            skipQuestion()
        },
        showDialogState = showSkipDialog
    )
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(top = 16.dp),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Button(
            onClick = {
                showSkipDialog.value = true
            },
            enabled = !quizState.isSubmitted && quizState.selectedAnswers.isEmpty() && !quizState.isLastItem,
            modifier = Modifier.weight(1f)
        ) {
            Text(stringResource(R.string.btn_skip))
        }
        SpacerLargeWidth()
        Button(
            onClick = {
                showSubmitConfirmationDialog.value = true
            },
            enabled = quizState.selectedAnswers.isNotEmpty() && !quizState.isSubmitted,
            modifier = Modifier.weight(1f)
        ) {
            Text(stringResource(R.string.btn_submit))
        }
        SpacerLargeWidth()
        Button(
            onClick = {
                if (quizState.isLastItem) {
                    navigateToResultScreen()
                } else {
                    moveToNextQuestion()
                }
            },
            enabled = quizState.isSubmitted || quizState.isLastItem,
            modifier = Modifier.weight(1f)
        ) {
            val strId = if (quizState.isLastItem) R.string.btn_result else R.string.btn_next
            Text(stringResource(strId))
        }
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewQuizButtons() {
    MaterialTheme {
        Box(modifier = Modifier.padding(16.dp)) {
            QuizButtons(
                quizState = QuizState(
                    currentQuestionNumber = 20,
                    totalQuestions = 30,
                    selectedAnswers = listOf(),
                    showExplanation = false,
                    isSubmitted = false,
                    isLastItem = false,
                ),
                submitAnswer = {},
                skipQuestion = {},
                moveToNextQuestion = {},
                navigateToResultScreen = {}

            )
        }
    }
}