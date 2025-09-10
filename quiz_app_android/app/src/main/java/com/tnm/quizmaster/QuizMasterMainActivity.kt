package com.tnm.quizmaster

import android.annotation.SuppressLint
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Scaffold
import androidx.compose.ui.Modifier
import com.tnm.quizmaster.presentation.theme.QuizMasterAndroidJavaKotlinTheme
import dagger.hilt.android.AndroidEntryPoint

@SuppressLint("UnusedMaterial3ScaffoldPaddingParameter")
@AndroidEntryPoint
class QuizMasterMainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        setContent {
            QuizMasterAndroidJavaKotlinTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { _ ->
                    AppNavHost()
                }
            }
        }
    }
}
