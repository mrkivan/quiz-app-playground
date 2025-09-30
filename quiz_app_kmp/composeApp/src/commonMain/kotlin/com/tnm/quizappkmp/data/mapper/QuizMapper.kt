package com.tnm.quizappkmp.data.mapper

import com.tnm.quizappkmp.data.dto.QuizListDto
import com.tnm.quizappkmp.domain.model.quiz.QuizData


fun QuizListDto.QuizItemDto.toDomain() = QuizData(
    questionId = questionId,
    question = question,
    answerCellType = answerCellType,
    selectedOptions = selectedOptions,
    answerSectionTitle = answerSectionTitle,
    explanation = explanation,
    answerCellList = answerCellList.map { it.toDomain() },
    correctAnswer = correctAnswer.toDomain()
)

fun QuizListDto.AnswerCellDto.toDomain() = QuizData.AnswerCell(
    answerId = answerId,
    questionId = questionId,
    data = data,
    isItAnswer = isItAnswer,
    position = position
)

fun QuizListDto.CorrectAnswerDto.toDomain() = QuizData.CorrectAnswer(
    questionId = questionId,
    answerId = answerId,
    answer = answer,
    explanation = explanation
)
