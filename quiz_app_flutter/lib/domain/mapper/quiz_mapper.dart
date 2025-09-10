import '../../data/model/quiz/quiz_list_dto.dart' as QuizListDto;
import '../entities/quiz/quiz_data.dart';

extension QuizItemDtoX on QuizListDto.QuizItemDto {
  QuizData toDomain() => QuizData(
    questionId: questionId,
    question: question,
    answerCellType: answerCellType,
    selectedOptions: selectedOptions,
    answerSectionTitle: answerSectionTitle,
    explanation: explanation,
    answerCellList: answerCellList.map((e) => e.toDomain()).toList(),
    correctAnswer: correctAnswer.toDomain(),
  );
}

extension AnswerCellDtoX on QuizListDto.AnswerCellDto {
  QuizAnswerCell toDomain() => QuizAnswerCell(
    answerId: answerId,
    questionId: questionId,
    data: data,
    isItAnswer: isItAnswer,
    position: position,
  );
}

extension CorrectAnswerDtoX on QuizListDto.CorrectAnswerDto {
  QuizCorrectAnswer toDomain() => QuizCorrectAnswer(
    questionId: questionId,
    answerId: answerId,
    answer: answer,
    explanation: explanation,
  );
}
