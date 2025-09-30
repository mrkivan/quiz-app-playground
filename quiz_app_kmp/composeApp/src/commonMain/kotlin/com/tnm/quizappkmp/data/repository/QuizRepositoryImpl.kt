package com.tnm.quizappkmp.data.repository

import com.tnm.quizappkmp.data.cache.CacheManager
import com.tnm.quizappkmp.data.mapper.toDomain
import com.tnm.quizappkmp.data.mapper.toQuizSetDomain
import com.tnm.quizappkmp.data.remote.QuizApi
import com.tnm.quizappkmp.domain.model.Resource
import com.tnm.quizappkmp.domain.model.dashboard.DashboardData
import com.tnm.quizappkmp.domain.model.quiz.QuizData
import com.tnm.quizappkmp.domain.model.quizSets.QuizSetData
import com.tnm.quizappkmp.domain.repositry.QuizRepository
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

    override fun getQuizListByTopic(topic: String): Flow<QuizSetData?> = flow {
        val cached = cache.getDashboard()
        if (cached != null) {
            val data = cached.items.firstOrNull { it.topic == topic }
            emit(data?.toQuizSetDomain())
        } else {
            emit(null)
        }
    }

    override fun getQuizzesBySetAndTopic(fileName: String): Flow<Resource<List<QuizData>>> = flow {
        try {
            val cached = cache.getQuiz(fileName)
            if (cached != null) {
                emit(Resource.Success(cached.items.map { it.toDomain() }))
                return@flow
            }
            val remote = api.getQuizSet(fileName)
            cache.saveQuiz(fileName, remote)
            emit(Resource.Success(remote.items.map { it.toDomain() }))
        } catch (e: Exception) {
            // Emit the Failure state with the error
            emit(Resource.Failure(e))
        }
    }
}