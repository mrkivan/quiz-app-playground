import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/repository/quiz_repository.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_quiz_set_list_usecase.g.dart';

@riverpod
Future<GetQuizSetListUseCase> getQuizSetListUseCase(Ref ref) async {
  final repository = await ref.watch(quizRepositoryProvider.future);
  return GetQuizSetListUseCase(repository);
}

class GetQuizSetListUseCase {
  final QuizRepository repository;

  GetQuizSetListUseCase(this.repository);

  Future<QuizSetData> call(String topic) async {
    return repository.getQuizListByTopic(topic);
  }
}
