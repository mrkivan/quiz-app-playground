package com.tnm.quizappkmp.data.cache

import com.russhwolf.settings.Settings
import com.russhwolf.settings.set
import com.tnm.quizappkmp.data.dto.DashboardDto
import com.tnm.quizappkmp.data.dto.QuizListDto
import kotlinx.serialization.json.Json

class CacheManager(
    private val settings: Settings,
    private val json: Json
) {
    fun saveDashboard(dashboard: DashboardDto) {
        settings[KEY_DASHBOARD] = json.encodeToString(dashboard)
    }

    fun getDashboard(): DashboardDto? {
        return settings.getStringOrNull(KEY_DASHBOARD)?.let {
            json.decodeFromString<DashboardDto>(it)
        }
    }

    fun saveQuiz(key: String, quizList: QuizListDto) {
        settings[getQuizKey(key)] = json.encodeToString(quizList)
    }

    fun getQuiz(key: String): QuizListDto? {
        return settings.getStringOrNull(getQuizKey(key))?.let {
            json.decodeFromString<QuizListDto>(it)
        }
    }

    fun saveResult(key: String, result: String) {
        settings[getQuizResultKey(key)] = result
    }

    fun getResult(key: String): String? {
        return settings.getStringOrNull(getQuizResultKey(key))
    }

    fun clear() {
        settings.clear()
    }

    private fun getQuizResultKey(key: String) = "quiz_result_$key"
    private fun getQuizKey(key: String) = "quiz_$key"

    private companion object {
        const val KEY_DASHBOARD = "dashboard_data"
    }
}