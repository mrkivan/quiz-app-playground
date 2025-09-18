import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/cache/cache_manager.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_result_data_usecase.g.dart';

@riverpod
Future<GetResultDataUseCase> getResultDataUseCase(Ref ref) async {
  final cacheManager = await ref.watch(cacheManagerProvider.future);
  return GetResultDataUseCase(cacheManager);
}

class GetResultDataUseCase {
  final CacheManager cacheManager;

  GetResultDataUseCase(this.cacheManager);

  Future<ResultData?> call(String key) async {
    return cacheManager.getResult(key);
  }
}
