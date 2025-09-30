package com.tnm.quizappkmp.presentation.quiz.ui

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Checkbox
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.RadioButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.tnm.quizappkmp.domain.model.quiz.QuizData
import com.tnm.quizappkmp.presentation.quiz.state.QuizState
import com.tnm.quizappkmp.presentation.utils.ui.QuizProgressWithShape
import com.tnm.quizappkmp.presentation.utils.ui.SpacerLargeHeight
import com.tnm.quizappkmp.presentation.utils.ui.TvHeadSmall
import com.tnm.quizappkmp.presentation.utils.ui.TvLarge
import com.tnm.quizappkmp.presentation.utils.ui.TvMedium

@Composable
fun QuizBody(
    quizData: QuizData,
    quizState: QuizState,
    updateSelectedAnswers: (List<Int>) -> Unit,
    submitAnswer: () -> Unit,
    skipQuestion: () -> Unit,
    moveToNextQuestion: () -> Unit,
    navigateToResultScreen: () -> Unit,
) {
    Box {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            verticalArrangement = Arrangement.SpaceBetween
        ) {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 16.dp)
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    TvHeadSmall(
                        text = quizData.question,
                        modifier = Modifier
                            .weight(1f)
                            .padding(end = 8.dp)
                    )
                    QuizProgressWithShape(
                        currentQuestion = quizState.currentQuestionNumber,
                        totalQuestions = quizState.totalQuestions,
                        modifier = Modifier.align(Alignment.Top)
                    )
                }
            }
            // Question and Answer Options
            Column(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxWidth()
            ) {
                SpacerLargeHeight()

                LazyColumn(
                    modifier = Modifier.fillMaxWidth(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    itemsIndexed(quizData.answerCellList) { index, answer ->
                        val isCorrect = quizData.correctAnswer.answerId.contains(answer.answerId)

                        val isSelected = quizState.selectedAnswers.contains(answer.answerId)
                        val backgroundColor = when {
                            !quizState.isSubmitted -> MaterialTheme.colorScheme.surface
                            isSelected && isCorrect -> Color.Green.copy(alpha = 0.2f)
                            isSelected && !isCorrect -> Color.Red.copy(alpha = 0.2f)
                            else -> MaterialTheme.colorScheme.surface
                        }

                        Column(
                            modifier = Modifier.clickable(
                                enabled = !quizState.isSubmitted
                            ) {
                                updateSelectedAnswers(
                                    if (quizData.answerCellType == 0) {
                                        // Single choice: replace selection
                                        listOf(answer.answerId)
                                    } else {
                                        // Multiple choice: toggle selection
                                        if (isSelected) {
                                            quizState.selectedAnswers - answer.answerId
                                        } else {
                                            quizState.selectedAnswers + answer.answerId
                                        }
                                    }
                                )
                            }
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .border(
                                        width = 1.dp,
                                        color = if (isSelected) MaterialTheme.colorScheme.primary else Color.Gray,
                                        shape = RoundedCornerShape(8.dp)
                                    )
                                    .background(backgroundColor)
                                    .padding(8.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                if (quizData.answerCellType == 0) {
                                    RadioButton(
                                        selected = isSelected,
                                        onClick = {
                                            updateSelectedAnswers(listOf(answer.answerId))
                                        },
                                        enabled = !quizState.isSubmitted
                                    )
                                } else {
                                    Checkbox(
                                        checked = isSelected,
                                        onCheckedChange = {
                                            updateSelectedAnswers(
                                                if (it) {
                                                    quizState.selectedAnswers + answer.answerId
                                                } else {
                                                    quizState.selectedAnswers - answer.answerId
                                                }
                                            )
                                        },
                                        enabled = !quizState.isSubmitted
                                    )
                                }
                                TvLarge(answer.data, Modifier.padding(start = 8.dp))
                            }
                        }
                    }
                }

                // Explanation
                if (quizState.showExplanation) {
                    SpacerLargeHeight()
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.surfaceVariant
                        )
                    ) {
                        TvMedium(quizData.explanation, Modifier.padding(16.dp))
                    }
                }
            }

            // Buttons
            QuizButtons(
                quizState = quizState,
                submitAnswer = submitAnswer,
                skipQuestion = skipQuestion,
                moveToNextQuestion = moveToNextQuestion,
                navigateToResultScreen = navigateToResultScreen,
            )
        }
    }
}