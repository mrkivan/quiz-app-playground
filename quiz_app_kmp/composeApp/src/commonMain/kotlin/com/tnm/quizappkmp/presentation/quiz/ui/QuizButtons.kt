package com.tnm.quizappkmp.presentation.quiz.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.tnm.quizappkmp.presentation.quiz.state.QuizState
import com.tnm.quizappkmp.presentation.utils.ui.ConfirmDialog
import com.tnm.quizappkmp.presentation.utils.ui.SpacerLargeWidth
import org.jetbrains.compose.resources.stringResource
import quiz_master_kmp.composeapp.generated.resources.Res
import quiz_master_kmp.composeapp.generated.resources.btn_confirm
import quiz_master_kmp.composeapp.generated.resources.btn_next
import quiz_master_kmp.composeapp.generated.resources.btn_result
import quiz_master_kmp.composeapp.generated.resources.btn_skip
import quiz_master_kmp.composeapp.generated.resources.btn_submit
import quiz_master_kmp.composeapp.generated.resources.dialog_skip_message
import quiz_master_kmp.composeapp.generated.resources.dialog_skip_title
import quiz_master_kmp.composeapp.generated.resources.dialog_submit_message
import quiz_master_kmp.composeapp.generated.resources.dialog_submit_title

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
        title = stringResource(Res.string.dialog_submit_title),
        message = stringResource(Res.string.dialog_submit_message),
        onConfirm = {
            submitAnswer()
        },
        confirmButtonLabel = stringResource(Res.string.btn_confirm),
        showDialogState = showSubmitConfirmationDialog
    )

    ConfirmDialog(
        title = stringResource(Res.string.dialog_skip_title),
        message = stringResource(Res.string.dialog_skip_message),
        confirmButtonLabel = stringResource(Res.string.btn_skip),
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
            Text(stringResource(Res.string.btn_skip))
        }
        SpacerLargeWidth()
        Button(
            onClick = {
                showSubmitConfirmationDialog.value = true
            },
            enabled = quizState.selectedAnswers.isNotEmpty() && !quizState.isSubmitted,
            modifier = Modifier.weight(1f)
        ) {
            Text(stringResource(Res.string.btn_submit))
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
            val strId = if (quizState.isLastItem) Res.string.btn_result else Res.string.btn_next
            Text(stringResource(strId))
        }
    }
}

