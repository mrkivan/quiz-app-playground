package com.tnm.shared.di

import com.russhwolf.settings.Settings
import com.tnm.quizappkmp.data.cache.CacheManager
import com.tnm.quizappkmp.data.remote.AppConfig
import com.tnm.quizappkmp.data.remote.HttpClientFactory
import com.tnm.quizappkmp.data.remote.QuizApi
import com.tnm.quizappkmp.domain.QuizRepository
import com.tnm.quizappkmp.data.repository.QuizRepositoryImpl
import com.tnm.quizappkmp.domain.GetDashboardDataUseCase
import com.tnm.quizappkmp.presentation.dashboard.viewmodel.DashboardViewModel
import io.ktor.client.HttpClient
import kotlinx.serialization.json.Json
import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.module
import com.russhwolf.settings.Settings as MultiplatformSettings // A good practice to avoid name clashes

val appModule = module {
    // Base dependencies
    single {
        Json {
            ignoreUnknownKeys = true
            prettyPrint = true
            isLenient = true
        }
    }

    // Use the top-level factory function provided by the no-arg module
    single<Settings> { MultiplatformSettings() }

    // CacheManager now has its dependency correctly provided
    single { CacheManager(get(), get()) }

    // Network
    single<HttpClient> { HttpClientFactory().create() }
    single { QuizApi(get(), AppConfig.baseUrl) }

    // Repository
    single<QuizRepository> { QuizRepositoryImpl(get(), get()) }

    // UseCases
    // No change needed here, it will now resolve its dependency
    factory { GetDashboardDataUseCase(get()) }

    // ViewModels
    // No change needed here, it will now resolve its dependency
    viewModelOf(::DashboardViewModel)
}
