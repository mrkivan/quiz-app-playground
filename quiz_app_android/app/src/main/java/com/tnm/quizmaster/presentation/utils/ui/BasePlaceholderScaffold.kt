package com.tnm.quizmaster.presentation.utils.ui

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import com.tnm.quizmaster.R
import com.tnm.quizmaster.presentation.utils.state.QuizAppUiState

@Composable
fun <T> PlaceholderScaffold(
    toolbarConfig: QuizAppToolbar,
    uiState: QuizAppUiState<T>,
    modifier: Modifier = Modifier,
    onRetryClicked: () -> Unit = {},
    bodyContent: @Composable (PaddingValues, T) -> Unit
) {
    val backgroundPainter = painterResource(id = R.drawable.ic_app_bg)
    Scaffold(
        topBar = {
            QuizAppTopAppBar(toolbarConfig = toolbarConfig)
        },
        modifier = modifier.fillMaxSize()
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentAlignment = Alignment.Center
        ) {
            Image(
                painter = backgroundPainter,
                contentDescription = "Background Image",
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop
            )
            when (uiState) {
                QuizAppUiState.Loading -> LoadingView()
                is QuizAppUiState.Success -> bodyContent(paddingValues, uiState.data)
                is QuizAppUiState.Error -> ErrorView(uiState.message) {
                    onRetryClicked.invoke()
                }
            }
        }
    }
}

// Reusable Loading View
@Composable
private fun LoadingView(modifier: Modifier = Modifier) {
    Box(
        modifier = modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        CircularProgressIndicator()
    }
}

// Reusable Error View
@Composable
private fun ErrorView(
    message: String,
    modifier: Modifier = Modifier,
    onRetryClicked: () -> Unit
) {
    Box(
        modifier = modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = "Failed to load data. Please try again.",
                modifier = Modifier.padding(bottom = 16.dp)
            )
            Button(onClick = onRetryClicked) {
                Text(text = stringResource(R.string.btn_retry))
                Icon(
                    imageVector = Icons.Default.Refresh,
                    contentDescription = stringResource(R.string.btn_retry),
                    modifier = Modifier.size(20.dp)
                )
            }
        }
    }
}