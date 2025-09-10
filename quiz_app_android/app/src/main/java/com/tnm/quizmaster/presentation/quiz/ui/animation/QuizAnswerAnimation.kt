package com.tnm.quizmaster.presentation.quiz.ui.animation

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.ExperimentalAnimationApi
import androidx.compose.foundation.layout.height
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.airbnb.lottie.compose.LottieAnimation
import com.airbnb.lottie.compose.LottieCompositionSpec
import com.airbnb.lottie.compose.animateLottieCompositionAsState
import com.airbnb.lottie.compose.rememberLottieComposition
import com.tnm.quizmaster.presentation.utils.ui.lottieExitTransition

@OptIn(ExperimentalAnimationApi::class)
@Composable
fun QuizAnswerAnimation(isSuccess: Boolean, onAnimationEnd: () -> Unit) {
    val fileName = if (isSuccess) "success.json" else "fail.json"
    val composition by rememberLottieComposition(LottieCompositionSpec.Asset(fileName))
    // Create an animation state
    val animState = animateLottieCompositionAsState(
        composition = composition,
        iterations = 1 // play once
    )

    // Track if animation has started
    var hasStarted by remember { mutableStateOf(false) }
    var isVisible by remember { mutableStateOf(true) }
    LaunchedEffect(animState.progress, animState.isAtEnd, animState.isPlaying) {
        if (!hasStarted && animState.isPlaying) {
            hasStarted = true
        }
        if (hasStarted && animState.isAtEnd && !animState.isPlaying) {
            hasStarted = false
            isVisible = false //hide view
            onAnimationEnd()
        }
    }

    AnimatedVisibility(
        visible = isVisible,
        exit = lottieExitTransition()
    ) {
        LottieAnimation(
            composition = composition,
            progress = { animState.progress },
            modifier = Modifier.height(200.dp)
        )
    }
}