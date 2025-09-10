package com.tnm.quizmaster.domain.usecase.quizSets

import com.tnm.quizmaster.domain.model.quizset.QuizSetData
import com.tnm.quizmaster.domain.repository.QuizRepository
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class GetQuizSetListUseCase @Inject constructor(
    private val repository: QuizRepository
) {
    operator fun invoke(topic: String): Flow<QuizSetData?> {
        return repository.getQuizListByTopic(topic)
    }
}