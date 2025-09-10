package com.tnm.quizmaster.data.mapper

import com.tnm.quizmaster.data.dto.QuizListDto
import com.tnm.quizmaster.domain.model.quiz.QuizData

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
