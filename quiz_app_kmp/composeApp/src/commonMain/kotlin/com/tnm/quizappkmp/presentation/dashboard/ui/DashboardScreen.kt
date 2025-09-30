package com.tnm.quizappkmp.presentation.dashboard.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.tnm.quizappkmp.presentation.dashboard.intent.DashboardIntent
import com.tnm.quizappkmp.presentation.dashboard.intent.DashboardNavEvent
import com.tnm.quizappkmp.presentation.dashboard.viewmodel.DashboardViewModel
import com.tnm.quizappkmp.presentation.utils.ui.PlaceholderScaffold
import com.tnm.quizappkmp.presentation.utils.ui.QuizAppToolbar
import org.jetbrains.compose.resources.stringResource
import org.koin.compose.viewmodel.koinViewModel
import quiz_master_kmp.composeapp.generated.resources.Res
import quiz_master_kmp.composeapp.generated.resources.app_name

@Composable
fun DashboardScreen(
    navigateToQuizSets: (quizTopic: String) -> Unit
) {
    val viewModel: DashboardViewModel = koinViewModel()

    fun loadData() {
        viewModel.handleIntent(DashboardIntent.LoadDashboard)
    }

    val uiState by viewModel.state.collectAsState()


    LaunchedEffect(Unit) {
        loadData()
        viewModel.navigationEvents.collect { event ->
            when (event) {
                is DashboardNavEvent.NavigateToQuizSets -> {
                    navigateToQuizSets.invoke(event.item.topic)
                }
            }
        }
    }

    PlaceholderScaffold(
        toolbarConfig = QuizAppToolbar(title = stringResource(Res.string.app_name)),
        uiState = uiState,
        modifier = Modifier,
        onRetryClicked = {
            loadData()
        }
    ) { data ->

        LazyColumn(
            modifier = Modifier
                .padding(16.dp)
                .fillMaxSize(),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {

            items(data.items.size) { index ->
                DashboardScreenItem(data.items[index]) {
                    viewModel.handleIntent(DashboardIntent.NavigateToQuizSets(data.items[index]))
                }
            }

        }
    }
}