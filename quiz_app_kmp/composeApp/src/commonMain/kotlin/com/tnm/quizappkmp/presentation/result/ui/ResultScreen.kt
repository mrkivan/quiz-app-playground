package com.tnm.quizappkmp.presentation.result.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Tab
import androidx.compose.material3.TabRow
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.tnm.quizappkmp.domain.model.result.ResultData
import com.tnm.quizappkmp.presentation.result.model.ResultScreenData
import com.tnm.quizappkmp.presentation.result.viewmodel.ResultViewModel
import com.tnm.quizappkmp.presentation.utils.state.QuizAppUiState
import com.tnm.quizappkmp.presentation.utils.ui.AppCardDefaults
import com.tnm.quizappkmp.presentation.utils.ui.AppColors
import com.tnm.quizappkmp.presentation.utils.ui.AppDimens
import com.tnm.quizappkmp.presentation.utils.ui.CircularPercentageProgress
import com.tnm.quizappkmp.presentation.utils.ui.PlaceholderScaffold
import com.tnm.quizappkmp.presentation.utils.ui.QuizAppToolbar
import com.tnm.quizappkmp.presentation.utils.ui.SpacerMediumHeight
import com.tnm.quizappkmp.presentation.utils.ui.toProgress
import org.jetbrains.compose.resources.stringResource
import org.koin.compose.viewmodel.koinViewModel
import quiz_master_kmp.composeapp.generated.resources.Res
import quiz_master_kmp.composeapp.generated.resources.label_back
import quiz_master_kmp.composeapp.generated.resources.label_error
import quiz_master_kmp.composeapp.generated.resources.label_loading
import quiz_master_kmp.composeapp.generated.resources.result_correct_answers
import quiz_master_kmp.composeapp.generated.resources.result_total_questions
import quiz_master_kmp.composeapp.generated.resources.tab_current
import quiz_master_kmp.composeapp.generated.resources.tab_incorrect
import quiz_master_kmp.composeapp.generated.resources.tab_skipped

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ResultScreen(
    key: String,
    navController: NavHostController
) {
    val viewModel: ResultViewModel = koinViewModel()

    val uiState by viewModel.state.collectAsState()
    var selectedTabIndex by remember { mutableIntStateOf(0) }

    LaunchedEffect(Unit) {
        viewModel.getResult(key)
    }
    PlaceholderScaffold(
        toolbarConfig = QuizAppToolbar(
            title = when (uiState) {
                QuizAppUiState.Loading -> stringResource(Res.string.label_loading)
                is QuizAppUiState.Success -> (uiState as QuizAppUiState.Success<ResultScreenData>).data.quizTitle.orEmpty()
                is QuizAppUiState.Error -> stringResource(Res.string.label_error)
            },
            navigationIcon = Icons.AutoMirrored.Filled.ArrowBack,
            navigationIconContentDescription = stringResource(Res.string.label_back),
            onNavigationClick = { navController.navigateUp() },
        ),
        uiState = uiState,
        modifier = Modifier
    ) { data ->
        // 1. Prepare filtered lists once
        val currentTabTitle = stringResource(Res.string.tab_current, data.totalCorrectItems)
        val skippedTabTitle = stringResource(Res.string.tab_skipped, data.totalSkippedItems)
        val incorrectTabTitle = stringResource(Res.string.tab_incorrect, data.totalInCorrectItems)

        // 2. Build dynamic tabs
        val tabs = remember(data.quizTitle) {
            mutableListOf<Pair<String, List<ResultData.Item>>>().apply {
                if (data.totalCorrectItems > 0) add(currentTabTitle to data.correctItems)
                if (data.totalSkippedItems > 0) add(skippedTabTitle to data.skippedItems)
                if (data.totalInCorrectItems > 0) add(incorrectTabTitle to data.incorrectItems)
            }
        }

        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Top: Summary Card as first item
            item {
                ResultReportCard(data)
            }
            // TabRow
            item {
                Column {
                    TabRow(selectedTabIndex = selectedTabIndex) {
                        tabs.forEachIndexed { index, tab ->
                            Tab(
                                selected = selectedTabIndex == index,
                                onClick = { selectedTabIndex = index },
                                text = { Text(tab.first) }
                            )
                        }
                    }
                    SpacerMediumHeight()
                }
            }
            // Filtered items for selected tab
            val filteredItems = tabs.getOrNull(selectedTabIndex)?.second ?: emptyList()

            // Add each item as a LazyColumn item with stable key
            items(
                items = filteredItems,
                key = { it.questionId } // use a stable unique ID if available
            ) { item ->
                ResultItemRow(item)
            }
        }
    }
}

@Composable
fun ResultReportCard(data: ResultScreenData) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(top = 16.dp)
    ) {
        data.quizDescription?.let {
            Text(
                text = it,
                fontWeight = FontWeight.Bold,
                style = MaterialTheme.typography.bodyLarge,
                modifier = Modifier.padding(bottom = 16.dp)
            )
        }

        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = AppCardDefaults.shape,
            elevation = AppCardDefaults.elevation()
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                // Left side: Texts
                Column(
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text(
                        text = stringResource(
                            Res.string.result_total_questions,
                            data.totalQuestions
                        )
                    )
                    Text(
                        text = stringResource(
                            Res.string.result_correct_answers,
                            data.totalCorrectItems
                        )
                    )
                }

                // Right side: Circular progress
                CircularPercentageProgress(
                    progress = data.resultPercentage.toProgress(),
                    size = AppDimens.ProgressIndicatorSize,
                    strokeWidth = AppDimens.ProgressStrokeWidth,
                    progressColor = AppColors.ProgressColor,
                    backgroundColor = AppColors.ProgressBackground
                )
            }
        }
    }// Column end
}