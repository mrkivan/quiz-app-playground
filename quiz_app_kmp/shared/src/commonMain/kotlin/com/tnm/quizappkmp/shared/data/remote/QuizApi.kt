package com.tnm.shared.data.remote

import com.tnm.shared.data.dto.DashboardDto
import com.tnm.shared.data.dto.QuizListDto
import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.request.*

class QuizApi(private val client: HttpClient, private val baseUrl: String) {

    suspend fun getDashboard(): DashboardDto =
        client.get("${baseUrl}quiz_sets.json").body()

    suspend fun getQuizSet(fileName: String): QuizListDto =
        client.get("$baseUrl$fileName").body()
}