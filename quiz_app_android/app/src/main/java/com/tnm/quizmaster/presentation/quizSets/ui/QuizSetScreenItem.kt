package com.tnm.quizmaster.presentation.quizSets.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.tnm.quizmaster.R
import com.tnm.quizmaster.domain.model.quizset.QuizSetData
import com.tnm.quizmaster.domain.model.result.ResultData
import com.tnm.quizmaster.presentation.utils.ui.BaseCardView
import com.tnm.quizmaster.presentation.utils.ui.CircleWithNumber
import com.tnm.quizmaster.presentation.utils.ui.SpacerLargeHeight
import com.tnm.quizmaster.presentation.utils.ui.SpacerSmallHeight
import com.tnm.quizmaster.presentation.utils.ui.TvQuizBodyDesc
import com.tnm.quizmaster.presentation.utils.ui.TvQuizBodyTitle

@Composable
fun QuizSetScreenItem(
    quizSetItemData: QuizSetData.SectionItem,
    onItemClick: () -> Unit,
    navigateToResultView: (fileName: String) -> Unit,
    modifier: Modifier = Modifier,
) {
    Box(
        modifier = modifier
            .padding(horizontal = 8.dp)
    ) {
        Box(
            modifier = Modifier.fillMaxWidth()
        ) {
            BaseCardView(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(start = 20.dp, end = 8.dp, top = 8.dp, bottom = 8.dp),
                onClick = onItemClick,
                bodyContent = {

                    Column(
                        modifier = Modifier
                            .padding(start = 16.dp),
                        verticalArrangement = Arrangement.Center
                    ) {
                        TvQuizBodyTitle(quizSetItemData.title)

                        SpacerSmallHeight()

                        TvQuizBodyDesc(quizSetItemData.description)

                        quizSetItemData.previousResult?.let {
                            SpacerSmallHeight()
                            PreviousResultButton(it) {
                                navigateToResultView.invoke(quizSetItemData.fileName)

                            }
                        }
                    }// Column end
                }// BaseCardView end
            )

            CircleWithNumber(
                number = quizSetItemData.position,
                modifier = Modifier.align(Alignment.CenterStart)
            )
        }// box with circle end

    }// main box end
}

@Composable
fun PreviousResultButton(resultData: ResultData?, navigateToResultView: () -> Unit) {
    if (resultData == null) return

    SpacerLargeHeight()
    Button(
        onClick = { navigateToResultView() },
        modifier = Modifier.fillMaxWidth(),
        contentPadding = PaddingValues(horizontal = 16.dp, vertical = 8.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(stringResource(R.string.previous_result, resultData.resultPercentage))
            Icon(
                imageVector = Icons.AutoMirrored.Filled.ArrowForward,
                contentDescription = "Navigate to result"
            )
        }

    }
}

@Preview(showBackground = true)
@Composable
fun QuizSetScreenItemPreview() {
    MaterialTheme {
        QuizSetScreenItem(
            quizSetItemData = getMockQuizSetData(),
            onItemClick = {},
            navigateToResultView = {},
            modifier = Modifier,
        )
    }
}
