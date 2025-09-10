package com.tnm.quizmaster.presentation.result.viewmodel

import app.cash.turbine.test
import com.tnm.quizmaster.domain.usecase.result.GetResultDataUseCase
import com.tnm.quizmaster.presentation.generateMockResultData
import com.tnm.quizmaster.presentation.utils.state.QuizAppUiState
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class ResultViewModelTest {

    private lateinit var viewModel: ResultViewModel
    private lateinit var getResultDataUseCase: GetResultDataUseCase

    private val resultData = generateMockResultData()

    @Before
    fun setup() {
        getResultDataUseCase = mockk()
        viewModel = ResultViewModel(getResultDataUseCase)
    }

    @Test
    fun `getResult emits Loading then Success`() = runTest {
        // Given
        coEvery { getResultDataUseCase("kotlin_1.json") } returns flowOf(resultData)

        // When
        viewModel.getResult("kotlin_1.json")

        // Then
        viewModel.state.test {
            assertTrue(awaitItem() is QuizAppUiState.Loading)

            val success = awaitItem()
            assertTrue(success is QuizAppUiState.Success)

            val screenData = success.data
            println(screenData)
            assertEquals("General Knowledge Quiz", screenData.quizTitle)
            assertEquals(1, screenData.correctItems.size)
            assertEquals(1, screenData.incorrectItems.size)
            assertEquals(0, screenData.skippedItems.size)
            assertEquals(50, screenData.resultPercentage)
            assertEquals(2, screenData.totalQuestions)

            cancelAndConsumeRemainingEvents()
        }
    }
}