package com.tnm.quizappkmp.domain.usecase.dashboard

import com.tnm.quizappkmp.domain.model.Resource
import com.tnm.quizappkmp.domain.model.dashboard.DashboardData
import com.tnm.quizappkmp.domain.repositry.QuizRepository
import kotlinx.coroutines.flow.Flow

class GetDashboardDataUseCase(
    private val repository: QuizRepository
) {
    operator fun invoke(): Flow<Resource<DashboardData>> {
        return repository.getDashboardData()
    }
}