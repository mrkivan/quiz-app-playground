package com.tnm.quizappkmp.domain.usecase.quiz

import com.tnm.quizappkmp.domain.model.Resource
import com.tnm.quizappkmp.domain.model.quiz.QuizData
import com.tnm.quizappkmp.domain.repositry.QuizRepository
import kotlinx.coroutines.flow.Flow

class GetQuizDataBySetAndTopicUseCase(
    private val repository: QuizRepository
) {
    operator fun invoke(fileName: String): Flow<Resource<List<QuizData>>> {
        return repository.getQuizzesBySetAndTopic(fileName)
    }
}