package com.tnm.shared.data.repository

import com.tnm.shared.data.cache.CacheManager
import com.tnm.shared.data.dto.QuizListDto
import com.tnm.shared.data.mapper.toDomain
import com.tnm.shared.data.remote.QuizApi
import com.tnm.quizappkmp.domain.DashboardData
import com.tnm.quizappkmp.domain.QuizRepository
import com.tnm.quizappkmp.domain.Resource
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow

class QuizRepositoryImpl(
    private val api: QuizApi,
    private val cache: CacheManager
) : QuizRepository {

    override fun getDashboardData(): Flow<Resource<DashboardData>> = flow {
        try {
            val cached = cache.getDashboard()
            if (cached != null) {
                emit(Resource.Success(cached.toDomain()))
                return@flow
            }

            val remote = api.getDashboard()
            cache.saveDashboard(remote)
            emit(Resource.Success(remote.toDomain()))
        } catch (e: Exception) {
            emit(Resource.Failure(e))
        }
    }

    override fun getQuizzesBySetAndTopic(fileName: String): Flow<Resource<QuizListDto>> = flow {
        try {
            val cached = cache.getQuiz(fileName)
            if (cached != null) {
                emit(Resource.Success(cached))
                return@flow
            }
            val remote = api.getQuizSet(fileName)
            cache.saveQuiz(fileName, remote)
            emit(Resource.Success(remote))
        } catch (e: Exception) {
            emit(Resource.Failure(e))
        }
    }
}