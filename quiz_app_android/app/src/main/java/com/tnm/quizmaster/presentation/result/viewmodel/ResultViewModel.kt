package com.tnm.quizmaster.presentation.result.viewmodel

import androidx.lifecycle.viewModelScope
import com.tnm.quizmaster.domain.usecase.result.GetResultDataUseCase
import com.tnm.quizmaster.presentation.result.model.ResultScreenData
import com.tnm.quizmaster.presentation.utils.viewmodel.BaseViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.onStart
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ResultViewModel @Inject constructor(
    private val getResultDataUseCase: GetResultDataUseCase,
) : BaseViewModel<ResultScreenData>() {
    fun getResult(key: String) {
        viewModelScope.launch {
            getResultDataUseCase(key)
                .onStart {
                    setLoading()
                }
                .catch { e ->
                    setError(e.message.orEmpty())
                }
                .collect { result ->
                    if (result == null) setError(ERROR_DATA_NOT_FOUND)
                    else {
                        // could be optimized with single pass filter for large items
                        val correctItems = result.resultItems.filter { it.result }
                        val skippedItems = result.resultItems.filter { it.isSkipped }
                        val incorrectItems =
                            result.resultItems.filter { !it.result && !it.isSkipped }

                        setSuccess(
                            ResultScreenData(
                                quizTitle = result.quizTitle,
                                quizDescription = result.quizDescription,

                                correctItems = correctItems,
                                skippedItems = skippedItems,
                                incorrectItems = incorrectItems,
                                totalCorrectItems = correctItems.size,
                                totalSkippedItems = skippedItems.size,
                                totalInCorrectItems = incorrectItems.size,
                                totalQuestions = result.resultItems.size,
                                resultPercentage = result.resultPercentage
                            )
                        )
                    }

                }
        }

    }
}