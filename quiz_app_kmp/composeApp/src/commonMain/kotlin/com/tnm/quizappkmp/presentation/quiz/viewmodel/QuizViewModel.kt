package com.tnm.quizappkmp.presentation.quiz.viewmodel

import androidx.lifecycle.viewModelScope
import com.tnm.quizappkmp.domain.model.Resource
import com.tnm.quizappkmp.domain.model.quiz.QuizData
import com.tnm.quizappkmp.domain.model.result.ResultData
import com.tnm.quizappkmp.domain.usecase.quiz.GetQuizDataBySetAndTopicUseCase
import com.tnm.quizappkmp.domain.usecase.result.SaveResultDataUseCase
import com.tnm.quizappkmp.presentation.quiz.intent.QuizIntent
import com.tnm.quizappkmp.presentation.quiz.intent.QuizNavEvent
import com.tnm.quizappkmp.presentation.quiz.route.QuizScreenData
import com.tnm.quizappkmp.presentation.quiz.state.QuizState
import com.tnm.quizappkmp.presentation.utils.viewmodel.BaseViewModel
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.onStart
import kotlinx.coroutines.launch

class QuizViewModel(
    private val getQuizDataUseCase: GetQuizDataBySetAndTopicUseCase,
    private val saveResultDataUseCase: SaveResultDataUseCase
) : BaseViewModel<QuizData>() {
    private val _quizState = MutableStateFlow(QuizState())
    val quizState: StateFlow<QuizState> = _quizState.asStateFlow()

    private val _quizResultState = MutableStateFlow<Boolean?>(null)
    val quizResultState: StateFlow<Boolean?> = _quizResultState.asStateFlow()

    private var cacheQuizList = listOf<QuizData>()

    private val _navigationEvents = MutableSharedFlow<QuizNavEvent>()
    val navigationEvents = _navigationEvents.asSharedFlow()

    private val resultItems = mutableListOf<ResultData.Item>()
    private var currentQuizPosition: Int = 0

    private var cacheScreenData: QuizScreenData? = null

    fun handleIntent(intent: QuizIntent) {
        when (intent) {
            is QuizIntent.LoadQuiz -> fetchQuiz(intent.data)
            QuizIntent.NavigateToResult -> {
                navigateToResultScreen()
            }

            QuizIntent.SkipQuestion -> {
                moveToNextQuestion(isSkipped = true)
            }

            QuizIntent.NextQuestion -> {
                moveToNextQuestion()
            }

            QuizIntent.SubmitAnswer -> {
                submitAnswer()
            }

            is QuizIntent.UpdateSelectedAnswers -> {
                updateSelectedAnswers(intent.answers)
            }
        }
    }

    private fun fetchQuiz(quizScreenData: QuizScreenData) {
        cacheScreenData = quizScreenData
        viewModelScope.launch {
            getQuizDataUseCase(quizScreenData.fileName)
                .onStart {
                    setLoading()
                }
                .catch { e ->
                    setError(e.message.orEmpty())
                }
                .collect { quizItems ->
                    when (quizItems) {
                        is Resource.Failure -> setError(quizItems.error.message.orEmpty())
                        is Resource.Success -> {
                            currentQuizPosition = 0
                            cacheQuizList = quizItems.data.shuffled()

                            setSuccess(cacheQuizList[currentQuizPosition])
                            _quizState.value = QuizState(
                                isLastItem = isLastItem(),
                                currentQuestionNumber = currentQuizPosition + 1,
                                totalQuestions = cacheQuizList.size
                            )
                        }

                    }

                }
        }
    }

    private fun updateSelectedAnswers(answers: List<Int>) {
        _quizState.value = _quizState.value.copy(selectedAnswers = answers)
    }

    private fun submitAnswer() {
        val currentQuiz = cacheQuizList[currentQuizPosition]
        val isCorrect =
            currentQuiz.correctAnswer.answerId.toSet() == _quizState.value.selectedAnswers.toSet()

        _quizState.value = _quizState.value.copy(isSubmitted = true, showExplanation = true)
        _quizResultState.value = isCorrect

    }

    fun showExitConfirmationDialog(): Boolean {
        return (getQuizId() > 1 || _quizState.value.selectedAnswers.isNotEmpty())
    }

    fun getQuizId() = currentQuizPosition + 1
    private fun moveToNextQuestion(isSkipped: Boolean = false) {
        _quizResultState.value = null
        saveResult(isSkipped)

        val nextIndex = currentQuizPosition + 1
        if (nextIndex < cacheQuizList.size) {
            currentQuizPosition = nextIndex

            setSuccess(cacheQuizList[currentQuizPosition])
            _quizState.value = QuizState(
                currentQuestionNumber = currentQuizPosition + 1,
                totalQuestions = cacheQuizList.size,
                isLastItem = isLastItem()
            )

        } else {
            navigateToResultScreen()
        }


    }

    // Save all results using use case
    private fun navigateToResultScreen() {
        saveResult()

        cacheScreenData?.let { data ->

            val correctAnswers = getCorrectResultsCount()

            val resultData = ResultData(
                quizTitle = data.quizTitle,
                quizDescription = data.quizDescription,
                resultItems = this.resultItems.toList(),
                totalCorrectAnswers = correctAnswers,
                totalQuestions = cacheQuizList.count(),
                resultPercentage = getResultPercentage(correctAnswers),
            )

            viewModelScope.launch {
                saveResultDataUseCase(data.fileName, resultData)
                    .collect {
                        _navigationEvents.emit(QuizNavEvent.NavigateToResult(getResultKey()))
                    }

            }
        }

    }

    private fun getCorrectResultsCount(): Int {
        return resultItems.count { it.result }
    }

    private fun getResultPercentage(correctAnswers: Int): Int {
        val totalQuestions = cacheQuizList.count()
        return if (totalQuestions > 0) {
            ((correctAnswers.toDouble() / totalQuestions.toDouble()) * 100).toInt()
        } else 0
    }

    private fun isLastItem(): Boolean {
        return currentQuizPosition + 1 == cacheQuizList.size
    }

    private fun getResultKey(): String {
        cacheScreenData?.let { data ->
            return data.fileName
        }
        return ""
    }

    private fun saveResult(isSkipped: Boolean = false) {
        val currentQuiz = cacheQuizList[currentQuizPosition]

        val resultItem = ResultData.Item(
            questionId = currentQuiz.questionId,
            question = currentQuiz.question,
            result = currentQuiz.correctAnswer.answerId.toSet() == _quizState.value.selectedAnswers.toSet(),
            correctAnswer = currentQuiz.correctAnswer.answer,
            explanation = currentQuiz.explanation,
            isSkipped = isSkipped
        )
        resultItems.add(resultItem)
    }
}