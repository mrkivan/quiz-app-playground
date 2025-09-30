package com.tnm.quizappkmp.presentation.quizSets.viewmodel

import androidx.lifecycle.viewModelScope
import com.tnm.quizappkmp.domain.model.quizSets.QuizSetData
import com.tnm.quizappkmp.domain.usecase.quizSets.GetQuizSetListUseCase
import com.tnm.quizappkmp.domain.usecase.result.GetResultDataUseCase
import com.tnm.quizappkmp.presentation.quiz.route.QuizScreenData
import com.tnm.quizappkmp.presentation.quizSets.intent.QuizSetIntent
import com.tnm.quizappkmp.presentation.quizSets.intent.QuizSetNavEvent
import com.tnm.quizappkmp.presentation.utils.viewmodel.BaseViewModel
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.asFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.flow.flatMapMerge
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.onStart
import kotlinx.coroutines.launch

class QuizSetViewModel(
    private val getQuizSetListUseCase: GetQuizSetListUseCase,
    private val getResultDataUseCase: GetResultDataUseCase
) : BaseViewModel<QuizSetData?>() {
    private val _navigationEvents = MutableSharedFlow<QuizSetNavEvent>()
    val navigationEvents = _navigationEvents.asSharedFlow()

    fun handleIntent(intent: QuizSetIntent) {
        when (intent) {
            is QuizSetIntent.LoadQuizSet -> loadQuizSet(intent.quizTopic)
            is QuizSetIntent.NavigateToQuiz -> {
                navigateToQuiz(intent.data)
            }
        }
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    private fun loadQuizSet(quizTopic: String?) {
        viewModelScope.launch {
            getQuizSetListUseCase(quizTopic.orEmpty())
                .onStart {
                    setLoading()
                }
                .catch { e ->
                    setError(e.message.orEmpty())
                }
                .collect { dashboard ->
                    dashboard?.let { quizSetData ->

                        quizSetData.sections.sortedBy { it.position }.asFlow()
                            .flatMapMerge(concurrency = MAX_CONCURRENT_REQUESTS) { section ->
                                flow {
                                    val result =
                                        getResultDataUseCase(section.fileName).firstOrNull()
                                    section.previousResult = result
                                    emit(Unit)
                                }
                            }
                            .collect() // will process all, max 3 at a time

                        setSuccess(quizSetData)
                    }
                }// getQuizSetListUseCase end
        }
    }


    private fun navigateToQuiz(data: QuizSetData.SectionItem) {
        val quizScreenData = QuizScreenData(
            quizTitle = data.title,
            quizDescription = data.description,
            fileName = data.fileName
        )
        viewModelScope.launch {
            _navigationEvents.emit(QuizSetNavEvent.NavigateToQuiz(quizScreenData))
        }
    }

    companion object {
        private const val MAX_CONCURRENT_REQUESTS = 40
    }
}