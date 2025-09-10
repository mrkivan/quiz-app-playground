package com.tnm.quizmaster.data.api

import com.tnm.quizmaster.data.dto.DashboardDto
import com.tnm.quizmaster.data.dto.QuizListDto
import retrofit2.http.GET
import retrofit2.http.Path

interface QuizApi {

    /**
     * Fetch dashboard data from root JSON.
     * Example URL: https://mrkivan.github.io/quiz_app_data/data.json
     */
    @GET("quiz_sets.json")
    suspend fun getDashboard(): DashboardDto

    /**
     * Fetch quizzes from a specific topic and set.
     * Example URL: https://mrkivan.github.io/quiz_app_data/android_quiz/android_1.json
     *
     * @param fileName topic name like "android/android_1.json", "java/java_1.json"
     */
    @GET("{fileName}")
    suspend fun getQuizSet(
        @Path("fileName") fileName: String
    ): QuizListDto
}