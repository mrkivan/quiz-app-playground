package com.tnm.quizmaster.presentation.quiz.ui.animation

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier

@Composable
fun QuizOverlayAnimation(
    resultState: Boolean?, // null = no animation, Correct / Wrong = animation
    onAnimationEnd: () -> Unit
) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center //centers child
    ) {
        when (resultState) {
            true -> QuizAnswerAnimation(true) { onAnimationEnd.invoke() }
            false -> QuizAnswerAnimation(false) { onAnimationEnd.invoke() }
            null -> {} // nothing
        }
    }
}