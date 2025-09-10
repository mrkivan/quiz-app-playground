package com.tnm.quizmaster.di

import com.tnm.quizmaster.data.repository.QuizRepositoryImpl
import com.tnm.quizmaster.domain.repository.QuizRepository
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
abstract class RepositoryModule {

    @Binds
    @Singleton
    abstract fun bindQuizRepository(
        impl: QuizRepositoryImpl
    ): QuizRepository
}