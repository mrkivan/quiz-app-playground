package com.tnm.quizappkmp

import android.app.Application
import com.tnm.quizappkmp.di.initKoin

class QuizApp : Application() {
    override fun onCreate() {
        super.onCreate()
        initKoin()
    }
}
