package com.tnm.quizmaster.presentation.dashboard.viewmodel

import app.cash.turbine.test
import com.tnm.quizmaster.domain.model.Resource
import com.tnm.quizmaster.domain.usecase.dashboard.GetDashboardDataUseCase
import com.tnm.quizmaster.presentation.dashboard.intent.DashboardIntent
import com.tnm.quizmaster.presentation.dashboard.intent.DashboardNavEvent
import com.tnm.quizmaster.presentation.mockDashboardData
import com.tnm.quizmaster.presentation.utils.state.QuizAppUiState
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class DashboardViewModelTest {

    private lateinit var viewModel: DashboardViewModel
    private lateinit var getDashboardDataUseCase: GetDashboardDataUseCase

    @Before
    fun setup() {
        getDashboardDataUseCase = mockk()
        viewModel = DashboardViewModel(getDashboardDataUseCase)
    }

    @Test
    fun `LoadDashboard emits Loading then Success`() = runTest {
        // Given
        coEvery { getDashboardDataUseCase() } returns flowOf(Resource.Success(mockDashboardData))

        // When
        viewModel.handleIntent(DashboardIntent.LoadDashboard)

        // Then
        viewModel.state.test {
            // 1st emission should be Loading
            val loadingState = awaitItem()
            assertTrue(loadingState is QuizAppUiState.Loading)

            // 2nd emission should be Success with correct data
            val successState = awaitItem()
            assertTrue(successState is QuizAppUiState.Success)
            assertEquals(mockDashboardData, (successState as QuizAppUiState.Success).data)

            cancelAndConsumeRemainingEvents()
        }
    }

    @Test
    fun `LoadDashboard emits Loading then Error`() = runTest {
        // Given
        val errorMessage = "Something went wrong"
        coEvery { getDashboardDataUseCase() } returns flowOf(Resource.Failure(Throwable(errorMessage)))

        // When
        viewModel.handleIntent(DashboardIntent.LoadDashboard)

        // Then
        viewModel.state.test {
            // 1st emission should be Loading
            val loadingState = awaitItem()
            assertTrue(loadingState is QuizAppUiState.Loading)

            // 2nd emission should be Error with correct message
            val errorState = awaitItem()
            assertTrue(errorState is QuizAppUiState.Error)
            assertEquals(errorMessage, (errorState as QuizAppUiState.Error).message)

            cancelAndConsumeRemainingEvents()
        }
    }

    @Test
    fun `NavigateToQuizSets emits navigation event`() = runTest {
        val item = mockDashboardData.items[0]

        viewModel.navigationEvents.test {
            // When
            viewModel.handleIntent(DashboardIntent.NavigateToQuizSets(item))

            // Then
            val event = awaitItem()
            assertEquals(DashboardNavEvent.NavigateToQuizSets(item), event)
            cancelAndConsumeRemainingEvents()
        }
    }
}