package com.tnm.quizmaster.presentation.quizSets.viewmodel

import app.cash.turbine.test
import com.tnm.quizmaster.domain.usecase.quizSets.GetQuizSetListUseCase
import com.tnm.quizmaster.domain.usecase.result.GetResultDataUseCase
import com.tnm.quizmaster.presentation.generateMockResultData
import com.tnm.quizmaster.presentation.mockQuizSetData
import com.tnm.quizmaster.presentation.quizSets.intent.QuizSetIntent
import com.tnm.quizmaster.presentation.quizSets.intent.QuizSetNavEvent
import com.tnm.quizmaster.presentation.utils.state.QuizAppUiState
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class QuizSetViewModelTest {

    private lateinit var viewModel: QuizSetViewModel
    private lateinit var getQuizSetListUseCase: GetQuizSetListUseCase
    private lateinit var getResultDataUseCase: GetResultDataUseCase

    @Before
    fun setup() {
        getQuizSetListUseCase = mockk()
        getResultDataUseCase = mockk()
        viewModel = QuizSetViewModel(getQuizSetListUseCase, getResultDataUseCase)
    }

    @Test
    fun `LoadQuizSet emits Loading then Success`() = runTest {
        // Given
        val quizSetData = mockQuizSetData
        val resultData = generateMockResultData()
        coEvery { getQuizSetListUseCase(any()) } returns flowOf(quizSetData)
        coEvery { getResultDataUseCase("kotlin_1.json") } returns flowOf(resultData)

        // When
        viewModel.handleIntent(QuizSetIntent.LoadQuizSet("General Knowledge"))

        // Then
        viewModel.state.test {
            // 1st emission = Loading
            assertTrue(awaitItem() is QuizAppUiState.Loading)

            // 2nd emission = Success
            val successState = awaitItem()
            assertTrue(successState is QuizAppUiState.Success)

            val data = successState.data
            assertEquals(1, data?.sections?.size)
            assertEquals(50, data?.sections?.first()?.previousResult?.resultPercentage)

            cancelAndConsumeRemainingEvents()
        }
    }

    @Test
    fun `NavigateToQuiz emits navigation event`() = runTest {
        // Given
        val section = mockQuizSetData.sections[0]

        // When
        viewModel.navigationEvents.test {
            viewModel.handleIntent(QuizSetIntent.NavigateToQuiz(section))

            // Then
            val event = awaitItem()
            assertTrue(event is QuizSetNavEvent.NavigateToQuiz)
            assertEquals("Kotlin Basics: Syntax and Variables", event.data.quizTitle)
            cancelAndConsumeRemainingEvents()
        }
    }
}