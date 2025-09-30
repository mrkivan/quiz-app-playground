package com.tnm.quizappkmp.presentation.utils.ui

fun Int.toProgress(): Float = this.coerceIn(0, 100) / 100f
