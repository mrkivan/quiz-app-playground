package com.tnm.quizappkmp.presentation.utils.viewmodel

import androidx.lifecycle.ViewModel
import com.tnm.quizappkmp.presentation.utils.state.QuizAppUiState
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

abstract class BaseViewModel<T> : ViewModel() {
    private val _state = MutableStateFlow<QuizAppUiState<T>>(QuizAppUiState.Loading)
    val state: StateFlow<QuizAppUiState<T>> = _state.asStateFlow()

    protected fun setLoading() {
        _state.value = QuizAppUiState.Loading
    }

    protected fun setSuccess(data: T) {
        _state.value = QuizAppUiState.Success(data)
    }

    protected fun setError(message: String) {
        _state.value = QuizAppUiState.Error(message)
    }

    companion object {
        const val ERROR_DATA_NOT_FOUND = "Data not found"

    }

}