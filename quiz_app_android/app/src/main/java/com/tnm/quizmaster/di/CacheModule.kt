package com.tnm.quizmaster.di

import android.content.Context
import com.google.gson.Gson
import com.tnm.quizmaster.data.cache.CacheManager
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object CacheModule {

    @Provides
    @Singleton
    fun provideGson(): Gson = Gson()

    @Provides
    @Singleton
    fun provideCacheManager(
        @ApplicationContext context: Context,
        gson: Gson
    ): CacheManager = CacheManager(context, gson)
}