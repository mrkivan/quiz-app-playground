package com.tnm.quizmaster

import android.app.Application
import com.tnm.quizmaster.data.cache.CacheManager
import dagger.hilt.android.HiltAndroidApp
import javax.inject.Inject

@HiltAndroidApp
class QuizMasterApp : Application() {
    @Inject
    lateinit var cacheManager: CacheManager

    override fun onCreate() {
        super.onCreate()

        cacheManager.checkAndClearCacheOnVersionChange()
    }
}