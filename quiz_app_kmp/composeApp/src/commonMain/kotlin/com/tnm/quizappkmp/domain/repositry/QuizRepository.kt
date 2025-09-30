package com.tnm.quizappkmp.domain.repositry

import com.tnm.quizappkmp.domain.model.Resource
import com.tnm.quizappkmp.domain.model.dashboard.DashboardData
import com.tnm.quizappkmp.domain.model.quiz.QuizData
import com.tnm.quizappkmp.domain.model.quizSets.QuizSetData
import kotlinx.coroutines.flow.Flow

interface QuizRepository {
    fun getDashboardData(): Flow<Resource<DashboardData>>
    fun getQuizListByTopic(topic: String): Flow<QuizSetData?>
    fun getQuizzesBySetAndTopic(fileName: String): Flow<Resource<List<QuizData>>>

}