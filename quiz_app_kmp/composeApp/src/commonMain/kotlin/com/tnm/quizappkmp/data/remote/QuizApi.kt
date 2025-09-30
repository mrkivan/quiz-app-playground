package com.tnm.quizappkmp.data.remote

import com.tnm.quizappkmp.data.dto.DashboardDto
import com.tnm.quizappkmp.data.dto.QuizListDto
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.request.get

class QuizApi(private val client: HttpClient, private val baseUrl: String) {

    suspend fun getDashboard(): DashboardDto =
        client.get("${baseUrl}quiz_sets.json").body()

    suspend fun getQuizSet(fileName: String): QuizListDto =
        client.get("$baseUrl$fileName").body()
}