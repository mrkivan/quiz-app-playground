package com.tnm.quizappkmp.presentation.quizSets.intent

import com.tnm.quizappkmp.domain.model.quizSets.QuizSetData
import com.tnm.quizappkmp.presentation.quiz.route.QuizScreenData

sealed class QuizSetIntent {
    data class LoadQuizSet(val quizTopic: String?) : QuizSetIntent()
    data class NavigateToQuiz(val data: QuizSetData.SectionItem) : QuizSetIntent()
}

sealed class QuizSetNavEvent {
    data class NavigateToQuiz(val data: QuizScreenData) : QuizSetNavEvent()
}