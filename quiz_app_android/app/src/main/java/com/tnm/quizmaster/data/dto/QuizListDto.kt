package com.tnm.quizmaster.data.dto

data class QuizListDto(
    val total: Int,
    val items: List<QuizItemDto>
) {
    data class QuizItemDto(
        val questionId: Int,
        val question: String,
        val answerCellType: Int,
        val selectedOptions: List<Int>?, // nullable list
        val answerSectionTitle: String?, // optional explanation title
        val explanation: String,
        val answerCellList: List<AnswerCellDto>,
        val correctAnswer: CorrectAnswerDto
    )

    data class AnswerCellDto(
        val answerId: Int,
        val questionId: Int,
        val data: String,
        val isItAnswer: Boolean,
        val position: Int
    )

    data class CorrectAnswerDto(
        val questionId: Int,
        val answerId: List<Int>,
        val answer: List<String>,
        val explanation: String
    )
}

