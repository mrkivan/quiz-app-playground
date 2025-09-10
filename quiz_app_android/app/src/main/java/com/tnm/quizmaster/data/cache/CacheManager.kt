package com.tnm.quizmaster.data.cache

import android.content.Context
import androidx.core.content.edit
import com.google.gson.Gson
import com.tnm.quizmaster.data.dto.DashboardDto
import com.tnm.quizmaster.data.dto.QuizListDto
import com.tnm.quizmaster.domain.model.dashboard.DashboardData
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton


@Singleton
class CacheManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val gson: Gson
) {
    private val dataCachePrefs =
        context.getSharedPreferences(APP_DATA_PREF_NAME, Context.MODE_PRIVATE)
    private val appVersionPrefs =
        context.getSharedPreferences(APP_VERSION_PREF_NAME, Context.MODE_PRIVATE)

    // TODO change DashboardData to DashboardDto
    fun saveDashboard(dashboard: DashboardData) {
        dataCachePrefs.edit { putString(DASHBOARD_DATA, gson.toJson(dashboard)) }
    }

    fun getDashboard(): DashboardDto? {
        return dataCachePrefs.getString(DASHBOARD_DATA, null)?.let {
            gson.fromJson(it, DashboardDto::class.java)
        }
    }

    fun saveQuiz(key: String, quizList: QuizListDto) {
        dataCachePrefs.edit { putString(getQuizKey(key), gson.toJson(quizList)) }
    }

    fun getQuiz(key: String): QuizListDto? {
        return dataCachePrefs.getString(getQuizKey(key), null)?.let {
            gson.fromJson(it, QuizListDto::class.java)
        }
    }

    fun saveResult(key: String, result: String) {
        dataCachePrefs.edit { putString(getQuizResultKey(key), result) }
    }

    fun getResult(key: String): String? {
        return dataCachePrefs.getString(getQuizResultKey(key), null)
    }

    fun clear() {
        dataCachePrefs.edit { clear() }
    }

    fun checkAndClearCacheOnVersionChange() {
        val savedVersion = appVersionPrefs.getString(APP_VERSION, null)
        val currentVersionName =
            context.packageManager.getPackageInfo(context.packageName, 0).versionName
        if (savedVersion != currentVersionName) {
            clear()
            appVersionPrefs.edit { putString(APP_VERSION, currentVersionName) }
        }
    }

    private fun getQuizResultKey(key: String) = "quiz_result_$key"
    private fun getQuizKey(key: String) = "quiz_$key"

    private companion object {
        const val APP_VERSION = "app_version"
        const val DASHBOARD_DATA = "dashboard_data"
        const val APP_DATA_PREF_NAME = "quiz_data_cache"
        const val APP_VERSION_PREF_NAME = "quiz_app_prefs"
    }
}