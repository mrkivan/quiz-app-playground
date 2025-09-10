import Foundation

// MARK: - Quiz Mapping

extension QuizListDTO.QuizItemDTO {
    func toDomain() -> QuizData {
        return QuizData(
            questionId: questionId,
            question: question,
            answerCellType: answerCellType,
            selectedOptions: selectedOptions,
            answerSectionTitle: answerSectionTitle,
            explanation: explanation,
            answerCellList: answerCellList.map { $0.toDomain() },
            correctAnswer: correctAnswer.toDomain()
        )
    }
}

extension QuizListDTO.AnswerCellDTO {
    func toDomain() -> QuizData.AnswerCell {
        return QuizData.AnswerCell(
            answerId: answerId,
            questionId: questionId,
            data: data,
            isItAnswer: isItAnswer,
            position: position
        )
    }
}

extension QuizListDTO.CorrectAnswerDTO {
    func toDomain() -> QuizData.CorrectAnswer {
        return QuizData.CorrectAnswer(
            questionId: questionId,
            answerId: answerId,
            answer: answer,
            explanation: explanation
        )
    }
}
