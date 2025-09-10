package com.tnm.quizmaster.domain.repository

import com.tnm.quizmaster.domain.model.Resource
import com.tnm.quizmaster.domain.model.dashboard.DashboardData
import com.tnm.quizmaster.domain.model.quiz.QuizData
import com.tnm.quizmaster.domain.model.quizset.QuizSetData
import kotlinx.coroutines.flow.Flow


interface QuizRepository {
    fun getDashboardData(): Flow<Resource<DashboardData>>
    fun getQuizListByTopic(topic: String): Flow<QuizSetData?>
    fun getQuizzesBySetAndTopic(fileName: String): Flow<Resource<List<QuizData>>>
}