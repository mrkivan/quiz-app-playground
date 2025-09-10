package com.tnm.quizmaster.presentation.quizSets.viewmodel

import androidx.lifecycle.viewModelScope
import com.tnm.quizmaster.domain.model.quizset.QuizSetData
import com.tnm.quizmaster.domain.usecase.quizSets.GetQuizSetListUseCase
import com.tnm.quizmaster.domain.usecase.result.GetResultDataUseCase
import com.tnm.quizmaster.presentation.quiz.route.QuizScreenData
import com.tnm.quizmaster.presentation.quizSets.intent.QuizSetIntent
import com.tnm.quizmaster.presentation.quizSets.intent.QuizSetNavEvent
import com.tnm.quizmaster.presentation.utils.viewmodel.BaseViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
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
import javax.inject.Inject

@HiltViewModel
class QuizSetViewModel @Inject constructor(
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
            quizSection = data
        )
        viewModelScope.launch {
            _navigationEvents.emit(QuizSetNavEvent.NavigateToQuiz(quizScreenData))
        }
    }

    companion object {
        private const val MAX_CONCURRENT_REQUESTS = 40
    }
}