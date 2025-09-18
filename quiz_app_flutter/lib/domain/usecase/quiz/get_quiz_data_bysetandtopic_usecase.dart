import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/repository/quiz_repository.dart';
import 'package:quiz_app_flutter/domain/entities/quiz/quiz_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_quiz_data_bysetandtopic_usecase.g.dart';

@riverpod
Future<GetQuizDataBySetAndTopicUseCase> getQuizDataBySetAndTopicUseCase(Ref ref) async {
  final repository = await ref.watch(quizRepositoryProvider.future);
  return GetQuizDataBySetAndTopicUseCase(repository);
}

class GetQuizDataBySetAndTopicUseCase {
  final QuizRepository repository;

  GetQuizDataBySetAndTopicUseCase(this.repository);

  Future<List<QuizData>> call(String fileName) async {
    return repository.getQuizzesBySetAndTopic(fileName);
  }
}
