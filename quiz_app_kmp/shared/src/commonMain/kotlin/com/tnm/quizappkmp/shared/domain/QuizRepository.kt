package com.tnm.shared.domain

import com.tnm.quizappkmp.data.dto.QuizListDto
import kotlinx.coroutines.flow.Flow

interface QuizRepository {
    fun getDashboardData(): Flow<Resource<DashboardData>>
    fun getQuizzesBySetAndTopic(fileName: String): Flow<Resource<QuizListDto>>
}