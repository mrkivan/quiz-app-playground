package com.tnm.quizappkmp.domain.usecase.result

import com.tnm.quizappkmp.data.cache.CacheManager
import com.tnm.quizappkmp.domain.model.result.ResultData
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.serialization.json.Json

class SaveResultDataUseCase(
    private val cacheManager: CacheManager,
    private val json: Json
) {
    operator fun invoke(key: String, result: ResultData): Flow<Unit> = flow {
        cacheManager.saveResult(key, json.encodeToString(result))
        emit(Unit) // Emit Unit to indicate success
    }
}