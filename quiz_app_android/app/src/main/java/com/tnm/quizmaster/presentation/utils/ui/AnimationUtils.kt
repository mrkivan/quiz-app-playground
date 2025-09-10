package com.tnm.quizmaster.presentation.utils.ui

import androidx.compose.animation.AnimatedContentTransitionScope
import androidx.compose.animation.ContentTransform
import androidx.compose.animation.ExitTransition
import androidx.compose.animation.core.tween
import androidx.compose.animation.fadeOut
import androidx.compose.animation.scaleOut
import androidx.compose.animation.slideInHorizontally
import androidx.compose.animation.slideOutHorizontally
import androidx.compose.animation.togetherWith

fun <S> horizontalSlideTransition(): AnimatedContentTransitionScope<S>.() -> ContentTransform = {
    slideInHorizontally { width -> width } togetherWith
            slideOutHorizontally { width -> -width }
}

fun lottieExitTransition(): ExitTransition {
    return fadeOut(animationSpec = tween(600)) +
            scaleOut(targetScale = 0.7f, animationSpec = tween(600))
}