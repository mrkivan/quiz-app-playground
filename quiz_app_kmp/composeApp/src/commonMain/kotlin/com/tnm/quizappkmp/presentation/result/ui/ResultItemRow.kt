package com.tnm.quizappkmp.presentation.result.ui

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Card
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.tnm.quizappkmp.domain.model.result.ResultData
import com.tnm.quizappkmp.presentation.utils.ui.AppCardDefaults
import com.tnm.quizappkmp.presentation.utils.ui.AppColors
import com.tnm.quizappkmp.presentation.utils.ui.SpacerSmallHeight
import org.jetbrains.compose.resources.stringResource
import quiz_master_kmp.composeapp.generated.resources.Res
import quiz_master_kmp.composeapp.generated.resources.label_answer


@Composable
fun ResultItemRow(item: ResultData.Item) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = AppCardDefaults.shape,
        elevation = AppCardDefaults.elevation()
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(text = item.question, fontWeight = FontWeight.Bold)
            SpacerSmallHeight()
            Text(
                text = stringResource(Res.string.label_answer),
                fontWeight = FontWeight.SemiBold,
                modifier = Modifier.padding(top = 4.dp)
            )
            Column(modifier = Modifier.padding(start = 8.dp, top = 2.dp)) {
                item.correctAnswer.forEach { answer ->
                    Text(
                        text = "• $answer",
                        color = if (item.result) AppColors.SuccessColor else Color.Red
                    )
                }
            }

            if (item.explanation.isNotEmpty()) {
                SpacerSmallHeight()
                Text(text = item.explanation, fontStyle = FontStyle.Italic)
            }
        }
    }
}