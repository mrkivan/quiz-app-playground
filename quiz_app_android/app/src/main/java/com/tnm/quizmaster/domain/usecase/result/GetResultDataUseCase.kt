package com.tnm.quizmaster.domain.usecase.result

import com.google.gson.Gson
import com.tnm.quizmaster.data.cache.CacheManager
import com.tnm.quizmaster.domain.model.result.ResultData
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import javax.inject.Inject

class GetResultDataUseCase @Inject constructor(
    private val cacheManager: CacheManager,
    private val gson: Gson
) {
    operator fun invoke(key: String): Flow<ResultData?> = flow {
        val result = cacheManager.getResult(key)?.let {
            gson.fromJson(it, ResultData::class.java)
        }

        emit(result)
    }
}