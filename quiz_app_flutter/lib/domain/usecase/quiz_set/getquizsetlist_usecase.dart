import 'package:quiz_app_flutter/core/resource.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:quiz_app_flutter/domain/repository/quiz_repository.dart';

class GetQuizSetListUseCase {
  final QuizRepository repository;

  GetQuizSetListUseCase(this.repository);

  Stream<Resource<QuizSetData>> call(String topic) {
    return repository.getQuizListByTopic(topic);
  }
}
