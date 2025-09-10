package com.tnm.quizmaster.presentation.quizSets.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import com.tnm.quizmaster.NavKeys
import com.tnm.quizmaster.QuizMasterDestinations
import com.tnm.quizmaster.R
import com.tnm.quizmaster.domain.model.quizset.QuizSetData
import com.tnm.quizmaster.presentation.quizSets.intent.QuizSetIntent
import com.tnm.quizmaster.presentation.quizSets.intent.QuizSetNavEvent
import com.tnm.quizmaster.presentation.quizSets.viewmodel.QuizSetViewModel
import com.tnm.quizmaster.presentation.utils.state.QuizAppUiState
import com.tnm.quizmaster.presentation.utils.ui.PlaceholderScaffold
import com.tnm.quizmaster.presentation.utils.ui.QuizAppToolbar

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QuizSetScreen(
    quizTopic: String,
    viewModel: QuizSetViewModel,
    navController: NavHostController,
    modifier: Modifier = Modifier
) {
    val uiState by viewModel.state.collectAsState()
    // Observe one-time events
    LaunchedEffect(Unit) {
        viewModel.handleIntent(QuizSetIntent.LoadQuizSet(quizTopic))
        viewModel.navigationEvents.collect { event ->
            when (event) {
                is QuizSetNavEvent.NavigateToQuiz -> {
                    navController.currentBackStackEntry?.savedStateHandle?.set(
                        NavKeys.DATA_KEY_QUIZ,
                        event.data
                    )
                    navController.navigate(QuizMasterDestinations.ROUTE_QUIZ + "/0")
                }
            }
        }
    }
    PlaceholderScaffold(
        toolbarConfig = QuizAppToolbar(
            title = when (uiState) {
                QuizAppUiState.Loading -> stringResource(R.string.label_loading)
                is QuizAppUiState.Success -> (uiState as QuizAppUiState.Success<QuizSetData?>).data?.title.orEmpty()
                is QuizAppUiState.Error -> stringResource(R.string.label_error)
            },
            navigationIcon = Icons.AutoMirrored.Filled.ArrowBack,
            navigationIconContentDescription = stringResource(R.string.label_back),
            onNavigationClick = { navController.navigateUp() }
        ),
        uiState = uiState,
        modifier = Modifier
    ) { paddingValues, data ->
        LazyColumn(
            state = rememberLazyListState(),
            modifier = modifier
                .fillMaxSize(),
            contentPadding = PaddingValues(8.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(
                items = data?.sections.orEmpty(),
                key = { section -> section.fileName }
            ) { section ->
                QuizSetScreenItem(
                    quizSetItemData = section,
                    onItemClick = {
                        viewModel.handleIntent(QuizSetIntent.NavigateToQuiz(section))
                    },
                    navigateToResultView = { fileName: String ->
                        navController.currentBackStackEntry?.savedStateHandle?.set(
                            NavKeys.DATA_KEY_RESULT,
                            fileName
                        )
                        navController.navigate(QuizMasterDestinations.ROUTE_RESULT)
                    }
                )
            }
        }
    }

}

@Preview(showBackground = true)
@Composable
fun QuizSetScreenPreview() {
    MaterialTheme {
        QuizSetScreen(
            viewModel = hiltViewModel(),
            navController = rememberNavController(),
            quizTopic = "Android"
        )
    }
}

