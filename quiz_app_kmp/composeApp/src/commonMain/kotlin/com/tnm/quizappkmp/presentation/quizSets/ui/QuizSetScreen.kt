package com.tnm.quizappkmp.presentation.quizSets.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.tnm.quizappkmp.QuizDestination
import com.tnm.quizappkmp.domain.model.quizSets.QuizSetData
import com.tnm.quizappkmp.presentation.quizSets.intent.QuizSetIntent
import com.tnm.quizappkmp.presentation.quizSets.intent.QuizSetNavEvent
import com.tnm.quizappkmp.presentation.quizSets.viewmodel.QuizSetViewModel
import com.tnm.quizappkmp.presentation.utils.state.QuizAppUiState
import com.tnm.quizappkmp.presentation.utils.ui.PlaceholderScaffold
import com.tnm.quizappkmp.presentation.utils.ui.QuizAppToolbar
import org.jetbrains.compose.resources.stringResource
import org.koin.compose.viewmodel.koinViewModel
import quiz_master_kmp.composeapp.generated.resources.Res
import quiz_master_kmp.composeapp.generated.resources.label_back
import quiz_master_kmp.composeapp.generated.resources.label_error
import quiz_master_kmp.composeapp.generated.resources.label_loading

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QuizSetScreen(
    quizTopic: String,
    navController: NavHostController,
    navigateToQuiz: (quizData: QuizDestination) -> Unit,
    navigateToResult: (quizKey: String) -> Unit,
) {
    val viewModel: QuizSetViewModel = koinViewModel()
    val uiState by viewModel.state.collectAsState()
    // Observe one-time events
    LaunchedEffect(Unit) {
        viewModel.handleIntent(QuizSetIntent.LoadQuizSet(quizTopic))
        viewModel.navigationEvents.collect { event ->
            when (event) {
                is QuizSetNavEvent.NavigateToQuiz -> {
                    navigateToQuiz.invoke(
                        QuizDestination(
                            quizTitle = event.data.quizTitle,
                            quizDescription = event.data.quizDescription,
                            fileName = event.data.fileName,
                        )
                    )
                }
            }
        }
    }
    PlaceholderScaffold(
        toolbarConfig = QuizAppToolbar(
            title = when (uiState) {
                QuizAppUiState.Loading -> stringResource(Res.string.label_loading)
                is QuizAppUiState.Success -> (uiState as QuizAppUiState.Success<QuizSetData?>).data?.title.orEmpty()
                is QuizAppUiState.Error -> stringResource(Res.string.label_error)
            },
            navigationIcon = Icons.AutoMirrored.Filled.ArrowBack,
            navigationIconContentDescription = stringResource(Res.string.label_back),
            onNavigationClick = { navController.navigateUp() }
        ),
        uiState = uiState,
        modifier = Modifier
    ) { data ->
        LazyColumn(
            state = rememberLazyListState(),
            modifier = Modifier
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
                        navigateToResult.invoke(fileName)
                    }
                )
            }
        }
    }

}