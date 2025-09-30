package com.tnm.shared.domain

import kotlinx.coroutines.flow.Flow

class GetDashboardDataUseCase(
    private val repository: QuizRepository
) {
    operator fun invoke(): Flow<Resource<DashboardData>> {
        return repository.getDashboardData()
    }
}