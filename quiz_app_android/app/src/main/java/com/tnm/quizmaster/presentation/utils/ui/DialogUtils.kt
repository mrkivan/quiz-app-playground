package com.tnm.quizmaster.presentation.utils.ui

import androidx.compose.material3.AlertDialog
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.ui.res.stringResource
import com.tnm.quizmaster.R

@Composable
fun ConfirmDialog(
    title: String,
    message: String,
    confirmButtonLabel: String,
    onConfirm: () -> Unit,
    onCancel: (() -> Unit)? = null,
    showDialogState: MutableState<Boolean>,
) {
    if (showDialogState.value) {
        AlertDialog(
            onDismissRequest = {
                showDialogState.value = false
                onCancel?.invoke()
            },
            title = {
                Text(text = title, style = MaterialTheme.typography.titleLarge)
            },
            text = {
                Text(text = message, style = MaterialTheme.typography.bodyMedium)
            },
            confirmButton = {
                TextButton(onClick = {
                    showDialogState.value = false
                    onConfirm()
                }) {
                    Text(confirmButtonLabel)
                }
            },
            dismissButton = {
                TextButton(onClick = {
                    showDialogState.value = false
                    onCancel?.invoke()
                }) {
                    Text(stringResource(R.string.btn_cancel))
                }
            }
        )
    }

}
