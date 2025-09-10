package com.tnm.quizmaster.domain.usecase.quiz

import com.tnm.quizmaster.domain.model.Resource
import com.tnm.quizmaster.domain.model.quiz.QuizData
import com.tnm.quizmaster.domain.repository.QuizRepository
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class GetQuizDataBySetAndTopicUseCase @Inject constructor(
    private val repository: QuizRepository
) {
    operator fun invoke(fileName: String): Flow<Resource<List<QuizData>>> {
        return repository.getQuizzesBySetAndTopic(fileName)
    }
}