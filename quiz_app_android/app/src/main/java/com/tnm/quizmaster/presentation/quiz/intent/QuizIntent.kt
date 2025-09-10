package com.tnm.quizmaster.presentation.quiz.intent

import com.tnm.quizmaster.presentation.quiz.route.QuizScreenData

sealed class QuizIntent {
    data class LoadQuiz(val data: QuizScreenData) : QuizIntent()
    object SubmitAnswer : QuizIntent()
    object SkipQuestion : QuizIntent()
    object NextQuestion : QuizIntent()
    data class UpdateSelectedAnswers(val answers: List<Int>) : QuizIntent()
    object NavigateToResult : QuizIntent()
}

sealed class QuizNavEvent {
    data class NavigateToResult(val key: String) : QuizNavEvent()
}