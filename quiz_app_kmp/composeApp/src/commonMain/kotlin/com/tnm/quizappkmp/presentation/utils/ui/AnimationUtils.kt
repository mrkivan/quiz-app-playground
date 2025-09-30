package com.tnm.quizappkmp.presentation.utils.ui

import androidx.compose.animation.AnimatedContentTransitionScope
import androidx.compose.animation.ContentTransform
import androidx.compose.animation.slideInHorizontally
import androidx.compose.animation.slideOutHorizontally
import androidx.compose.animation.togetherWith

fun <S> horizontalSlideTransition(): AnimatedContentTransitionScope<S>.() -> ContentTransform = {
    slideInHorizontally { width -> width } togetherWith
            slideOutHorizontally { width -> -width }
}