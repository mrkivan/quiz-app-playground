package com.tnm.quizmaster.domain.usecase.dashboard

import com.tnm.quizmaster.domain.model.Resource
import com.tnm.quizmaster.domain.model.dashboard.DashboardData
import com.tnm.quizmaster.domain.repository.QuizRepository
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class GetDashboardDataUseCase @Inject constructor(
    private val repository: QuizRepository
) {
    operator fun invoke(): Flow<Resource<DashboardData>> {
        return repository.getDashboardData()
    }
}