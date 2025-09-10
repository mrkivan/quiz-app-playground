package com.tnm.quizmaster.presentation.quiz.viewmodel

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import app.cash.turbine.test
import com.tnm.quizmaster.domain.model.Resource
import com.tnm.quizmaster.domain.usecase.quiz.GetQuizDataBySetAndTopicUseCase
import com.tnm.quizmaster.domain.usecase.result.SaveResultDataUseCase
import com.tnm.quizmaster.presentation.mockQuizData
import com.tnm.quizmaster.presentation.mockQuizScreenData
import com.tnm.quizmaster.presentation.quiz.intent.QuizIntent
import com.tnm.quizmaster.presentation.quiz.intent.QuizNavEvent
import com.tnm.quizmaster.presentation.utils.state.QuizAppUiState
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.UnconfinedTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

@OptIn(ExperimentalCoroutinesApi::class)
class QuizViewModelTest {

    @get:Rule
    val instantTaskExecutorRule = InstantTaskExecutorRule()

    private val testDispatcher = UnconfinedTestDispatcher()

    private lateinit var viewModel: QuizViewModel
    private lateinit var getQuizDataUseCase: GetQuizDataBySetAndTopicUseCase
    private lateinit var saveResultDataUseCase: SaveResultDataUseCase

    private val quizScreenData = mockQuizScreenData

    private val quizData = listOf(
        mockQuizData,
        mockQuizData.copy(questionId = 2, question = "What is 33?", explanation = "33 equals 6")
    )

    @Before
    fun setup() {
        Dispatchers.setMain(testDispatcher)
        getQuizDataUseCase = mockk()
        saveResultDataUseCase = mockk()
        viewModel = QuizViewModel(getQuizDataUseCase, saveResultDataUseCase)

        coEvery { getQuizDataUseCase(any()) } returns flowOf(Resource.Success(quizData))
        coEvery { saveResultDataUseCase(any(), any()) } returns flow { emit(Unit) }
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `fetchQuiz should load quiz data successfully`() = runTest {
        // When
        viewModel.handleIntent(QuizIntent.LoadQuiz(quizScreenData))
        // As quiz sets are shuffled, we have to check id belongs among all the questions
        val questionIds = quizData.map { it.questionId }.toSet()

        // Then
        viewModel.state.test {
            val state = awaitItem()
            assertTrue(state is QuizAppUiState.Success)
            assertTrue(
                questionIds.contains(state.data.questionId),
                "state.data.questionId should be in quizData questionIds"
            )
            cancelAndIgnoreRemainingEvents()
        }

        viewModel.quizState.test {
            val state = awaitItem()
            assertEquals(1, state.currentQuestionNumber)
            assertEquals(2, state.totalQuestions)
            assertFalse(state.isLastItem)
            cancelAndIgnoreRemainingEvents()
        }
    }

    @Test
    fun `fetchQuiz should handle failure`() = runTest {
        // Given
        val errorMessage = "Failed to load quiz"
        coEvery { getQuizDataUseCase(any()) } returns flowOf(Resource.Failure(Exception(errorMessage)))

        // When
        viewModel.handleIntent(QuizIntent.LoadQuiz(quizScreenData))

        // Then
        viewModel.state.test {
            val state = awaitItem()
            assertTrue(state is QuizAppUiState.Error)
            assertEquals(errorMessage, state.message)
            cancelAndIgnoreRemainingEvents()
        }
    }

    @Test
    fun `submitAnswer should update quiz state and result correctly`() = runTest {
        // Given
        viewModel.handleIntent(QuizIntent.LoadQuiz(quizScreenData))
        viewModel.handleIntent(QuizIntent.UpdateSelectedAnswers(listOf(1)))

        // When
        viewModel.handleIntent(QuizIntent.SubmitAnswer)

        // Then
        viewModel.quizState.test {
            val state = awaitItem()
            assertTrue(state.isSubmitted)
            assertTrue(state.showExplanation)
            cancelAndIgnoreRemainingEvents()
        }

        viewModel.quizResultState.test {
            val result = awaitItem()
            assertTrue(result == true)
            cancelAndIgnoreRemainingEvents()
        }
    }

    @Test
    fun `moveToNextQuestion should navigate to next question`() = runTest {
        // Given
        // As quiz sets are shuffled, we have to check id belongs among all the questions
        val questionIds = quizData.map { it.questionId }.toSet()
        viewModel.handleIntent(QuizIntent.LoadQuiz(quizScreenData))

        // When
        viewModel.handleIntent(QuizIntent.NextQuestion)

        // Than
        viewModel.quizState.test {
            val state = awaitItem()
            assertEquals(2, state.currentQuestionNumber)
            assertTrue(state.isLastItem)
            cancelAndIgnoreRemainingEvents()
        }

        viewModel.state.test {
            val state = awaitItem()
            assertTrue(state is QuizAppUiState.Success)
            assertTrue(
                questionIds.contains(state.data.questionId),
                "state.data.questionId should be in quizData questionIds"
            )

            cancelAndIgnoreRemainingEvents()
        }
    }

    @Test
    fun `navigateToResult should save results and emit navigation event`() = runTest {
        // When
        viewModel.handleIntent(QuizIntent.LoadQuiz(quizScreenData))
        testScheduler.advanceUntilIdle() // Wait for LoadQuiz to complete
        viewModel.handleIntent(QuizIntent.UpdateSelectedAnswers(listOf(1)))
        testScheduler.advanceUntilIdle() // Wait for UpdateSelectedAnswers to complete
        viewModel.handleIntent(QuizIntent.SubmitAnswer)
        testScheduler.advanceUntilIdle() // Wait for SubmitAnswer to complete

        // Then
        viewModel.navigationEvents.test {
            viewModel.handleIntent(QuizIntent.NavigateToResult)
            testScheduler.advanceUntilIdle() // Wait for NavigateToResult to complete

            val event = awaitItem()
            assertEquals(
                QuizNavEvent.NavigateToResult("kotlin_1.json"),
                event,
                "Navigation event should match"
            )
            cancelAndIgnoreRemainingEvents()
        }
    }

    @Test
    fun `showExitConfirmationDialog should return true when quiz is in progress`() = runTest {
        // When
        viewModel.handleIntent(QuizIntent.LoadQuiz(quizScreenData))
        viewModel.handleIntent(QuizIntent.UpdateSelectedAnswers(listOf(1)))

        // Than
        val result = viewModel.showExitConfirmationDialog()
        assertTrue(result)
    }
}