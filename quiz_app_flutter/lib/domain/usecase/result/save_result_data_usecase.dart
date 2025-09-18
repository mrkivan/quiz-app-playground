import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/repository/result_repository.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_result_data_usecase.g.dart';

@riverpod
Future<SaveResultDataUseCase> saveResultDataUseCase(Ref ref) async {
  final repository = await ref.watch(resultRepositoryProvider.future);

  return SaveResultDataUseCase(repository);
}

class SaveResultDataUseCase {
  final ResultRepository repository;

  SaveResultDataUseCase(this.repository);

  Future<void> call(String key, ResultData result) async {
    await repository.saveResult(key, result);
  }
}
