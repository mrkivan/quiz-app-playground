package com.tnm.shared.data.remote

import com.tnm.quizmaster.BuildKonfig


object AppConfig {
    val baseUrl: String get() = BuildKonfig.BASE_URL
}