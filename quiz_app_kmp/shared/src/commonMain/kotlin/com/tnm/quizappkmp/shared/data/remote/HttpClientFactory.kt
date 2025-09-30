package com.tnm.shared.data.remote


import io.ktor.client.*

expect class HttpClientFactory() {
    fun create(): HttpClient
}