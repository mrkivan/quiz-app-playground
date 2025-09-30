package com.tnm.quizappkmp.di


import com.russhwolf.settings.Settings
import com.tnm.quizappkmp.data.cache.CacheManager
import com.tnm.quizappkmp.data.remote.AppConfig
import com.tnm.quizappkmp.data.remote.QuizApi
import com.tnm.quizappkmp.data.repository.QuizRepositoryImpl
import com.tnm.quizappkmp.domain.repositry.QuizRepository
import com.tnm.quizappkmp.domain.usecase.dashboard.GetDashboardDataUseCase
import com.tnm.quizappkmp.domain.usecase.quiz.GetQuizDataBySetAndTopicUseCase
import com.tnm.quizappkmp.domain.usecase.quizSets.GetQuizSetListUseCase
import com.tnm.quizappkmp.domain.usecase.result.GetResultDataUseCase
import com.tnm.quizappkmp.domain.usecase.result.SaveResultDataUseCase
import com.tnm.quizappkmp.presentation.dashboard.viewmodel.DashboardViewModel
import com.tnm.quizappkmp.presentation.quiz.viewmodel.QuizViewModel
import com.tnm.quizappkmp.presentation.quizSets.viewmodel.QuizSetViewModel
import com.tnm.quizappkmp.presentation.result.viewmodel.ResultViewModel
import io.ktor.client.HttpClient
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.http.ContentType
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json
import org.koin.core.context.startKoin
import org.koin.core.module.dsl.factoryOf
import org.koin.dsl.module
import com.russhwolf.settings.Settings as MultiplatformSettings


val dataModule = module {
    single { Json { ignoreUnknownKeys = true } }
    single {
        val json = get<Json>()
        HttpClient {
            install(ContentNegotiation) {
                json(json, contentType = ContentType.Any)
            }
        }
    }
    // Use the top-level factory function provided by the no-arg module
    single<Settings> { MultiplatformSettings() }
    single { CacheManager(get(), get()) }
    single { QuizApi(get(), AppConfig.baseUrl) }

    // Repository
    single<QuizRepository> { QuizRepositoryImpl(get(), get()) }
}
val useCaseModule = module {
    factoryOf(::GetDashboardDataUseCase)
    factoryOf(::GetQuizDataBySetAndTopicUseCase)
    factoryOf(::GetQuizSetListUseCase)
    factoryOf(::GetResultDataUseCase)
    factoryOf(::SaveResultDataUseCase)
}
val viewModelModule = module {
    factoryOf(::DashboardViewModel)
    factoryOf(::QuizSetViewModel)
    factoryOf(::QuizViewModel)
    factoryOf(::ResultViewModel)
}

fun initKoin() {
    startKoin {
        modules(
            dataModule,
            useCaseModule,
            viewModelModule,
        )
    }
}