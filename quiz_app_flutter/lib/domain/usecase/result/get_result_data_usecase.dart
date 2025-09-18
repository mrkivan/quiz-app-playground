import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/repository/result_repository.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_result_data_usecase.g.dart';

@riverpod
Future<GetResultDataUseCase> getResultDataUseCase(Ref ref) async {
  final repository = await ref.watch(resultRepositoryProvider.future);
  return GetResultDataUseCase(repository);
}

class GetResultDataUseCase {
  final ResultRepository repository;

  GetResultDataUseCase(this.repository);

  Future<ResultData?> call(String key) async {
    debugPrint('GetResultDataUseCase: $key');
    return repository.getResult(key);
  }
}
