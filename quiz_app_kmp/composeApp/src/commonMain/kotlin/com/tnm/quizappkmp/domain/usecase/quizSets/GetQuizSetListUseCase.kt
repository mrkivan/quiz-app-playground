package com.tnm.quizappkmp.domain.usecase.quizSets

import com.tnm.quizappkmp.domain.model.quizSets.QuizSetData
import com.tnm.quizappkmp.domain.repositry.QuizRepository
import kotlinx.coroutines.flow.Flow

class GetQuizSetListUseCase(
    private val repository: QuizRepository
) {
    operator fun invoke(topic: String): Flow<QuizSetData?> {
        return repository.getQuizListByTopic(topic)
    }
}