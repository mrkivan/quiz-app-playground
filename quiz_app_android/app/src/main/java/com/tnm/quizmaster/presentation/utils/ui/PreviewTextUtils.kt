package com.tnm.quizmaster.presentation.utils.ui

import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview

@Preview(showBackground = true)
@Composable
fun PreviewToolbarTitle() {
    MaterialTheme {
        ToolbarTitle(title = "Toolbar Title Example")
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewTvDashboardTitle() {
    MaterialTheme {
        TvDashboardTitle(text = "Dashboard Item Title Example with Long Text")
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewTvQuizBodyTitle() {
    MaterialTheme {
        TvQuizBodyTitle(text = "Quiz Question Title Example")
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewTvQuizBodyDesc() {
    MaterialTheme {
        TvQuizBodyDesc(text = "This is a description for the quiz question. It may span two lines.")
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewTvMedium() {
    MaterialTheme {
        TvMedium(text = "Medium body text example")
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewTvLarge() {
    MaterialTheme {
        TvLarge(text = "Large text example")
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewTvHeadSmall() {
    MaterialTheme {
        TvHeadSmall(text = "Small headline example")
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewTvResultTitle() {
    MaterialTheme {
        TvResultTitle(text = "Quiz Results")
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewTvResultSectionTitle() {
    MaterialTheme {
        TvResultSectionTitle(text = "Section Title")
    }
}

