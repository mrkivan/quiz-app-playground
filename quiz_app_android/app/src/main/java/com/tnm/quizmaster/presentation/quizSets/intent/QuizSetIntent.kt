package com.tnm.quizmaster.presentation.quizSets.intent

import com.tnm.quizmaster.domain.model.quizset.QuizSetData
import com.tnm.quizmaster.presentation.quiz.route.QuizScreenData

sealed class QuizSetIntent {
    data class LoadQuizSet(val quizTopic: String?) : QuizSetIntent()
    data class NavigateToQuiz(val data: QuizSetData.SectionItem) : QuizSetIntent()
}

sealed class QuizSetNavEvent {
    data class NavigateToQuiz(val data: QuizScreenData) : QuizSetNavEvent()
}