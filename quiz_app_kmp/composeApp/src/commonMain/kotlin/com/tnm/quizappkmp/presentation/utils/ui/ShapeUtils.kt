package com.tnm.quizappkmp.presentation.utils.ui

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import org.jetbrains.compose.resources.stringResource
import quiz_master_kmp.composeapp.generated.resources.Res
import quiz_master_kmp.composeapp.generated.resources.question_progress

object AppCardDefaults {
    val shape = RoundedCornerShape(8.dp)

    @Composable
    fun elevation() = CardDefaults.cardElevation(defaultElevation = 4.dp)

    @Composable
    fun colors() = CardDefaults.cardColors()
}

@Composable
fun SpacerSmallHeight() {
    Spacer(modifier = Modifier.height(4.dp))
}

@Composable
fun SpacerMediumHeight() {
    Spacer(modifier = Modifier.height(8.dp))
}

@Composable
fun SpacerLargeHeight() {
    Spacer(modifier = Modifier.height(16.dp))
}

@Composable
fun SpacerMediumWidth() {
    Spacer(modifier = Modifier.width(8.dp))
}

@Composable
fun SpacerLargeWidth() {
    Spacer(modifier = Modifier.width(16.dp))
}


@Composable
fun CircleWithNumber(number: Int, modifier: Modifier = Modifier) {
    Box(
        modifier = modifier
            .size(40.dp)
            .background(
                MaterialTheme.colorScheme.primary,
                shape = CircleShape
            ),
    ) {
        Text(
            text = number.toString(),
            color = Color.White,
            modifier = Modifier.align(Alignment.Center),
            fontSize = 18.sp,
            fontWeight = FontWeight.Bold
        )
    }


}

@Composable
fun QuizProgressWithShape(
    currentQuestion: Int,
    totalQuestions: Int,
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier
            .clip(
                shape = RoundedCornerShape(
                    topStart = 16.dp,
                    bottomEnd = 16.dp,
                    bottomStart = 0.dp,
                    topEnd = 0.dp
                )
            )
            .background(Color.Blue)
            .padding(horizontal = 8.dp, vertical = 8.dp)
    ) {
        Text(
            text = stringResource(
                Res.string.question_progress,
                currentQuestion,
                totalQuestions
            ),
            color = Color.White,
            style = MaterialTheme.typography.titleMedium
        )
    }
}

@Composable
fun CircularPercentageProgress(
    progress: Float, // 0f..1f
    size: Dp = 50.dp,
    strokeWidth: Dp = 8.dp,
    progressColor: Color = AppColors.SuccessColor,
    backgroundColor: Color = AppColors.LightGray,
    percentageTextStyle: TextStyle = TextStyle(
        fontSize = 20.sp,
        fontWeight = FontWeight.Bold,
        color = Color.Black
    )
) {
    Box(
        contentAlignment = Alignment.Center,
        modifier = Modifier.size(size)
    ) {
        // Background circle
        Canvas(modifier = Modifier.fillMaxSize()) {
            drawArc(
                color = backgroundColor,
                startAngle = -90f,
                sweepAngle = 360f,
                useCenter = false,
                style = Stroke(width = strokeWidth.toPx(), cap = StrokeCap.Round)
            )

            // Progress arc
            drawArc(
                color = progressColor,
                startAngle = -90f,
                sweepAngle = 360 * progress,
                useCenter = false,
                style = Stroke(width = strokeWidth.toPx(), cap = StrokeCap.Round)
            )
        }

        // Percentage text
        Text(
            text = "${(progress * 100).toInt()}%",
            style = percentageTextStyle
        )
    }
}