import 'package:quiz_app_flutter/core/resource.dart';
import 'package:quiz_app_flutter/domain/entities/quiz/quiz_data.dart';
import 'package:quiz_app_flutter/domain/repository/quiz_repository.dart';

class GetQuizDataBySetAndTopicUseCase {
  final QuizRepository repository;

  GetQuizDataBySetAndTopicUseCase(this.repository);

  Stream<Resource<List<QuizData>>> call(String fileName) {
    return repository.getQuizzesBySetAndTopic(fileName);
  }
}
