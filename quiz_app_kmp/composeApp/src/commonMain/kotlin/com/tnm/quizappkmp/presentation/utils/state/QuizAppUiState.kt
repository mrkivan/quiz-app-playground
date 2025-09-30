package com.tnm.quizappkmp.presentation.utils.state

// Generic UI state sealed interface
sealed interface QuizAppUiState<out T> {
    object Loading : QuizAppUiState<Nothing>
    data class Success<T>(val data: T) : QuizAppUiState<T>
    data class Error(val message: String) : QuizAppUiState<Nothing>
}