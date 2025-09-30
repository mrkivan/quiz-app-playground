package com.tnm.quizappkmp.domain.usecase.result

import com.tnm.quizappkmp.data.cache.CacheManager
import com.tnm.quizappkmp.domain.model.result.ResultData
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.serialization.json.Json

class GetResultDataUseCase(
    private val cacheManager: CacheManager,
    private val json: Json
) {
    operator fun invoke(key: String): Flow<ResultData?> = flow {
        val result = cacheManager.getResult(key)?.let {
            json.decodeFromString<ResultData>(it)
        }
        emit(result)
    }
}