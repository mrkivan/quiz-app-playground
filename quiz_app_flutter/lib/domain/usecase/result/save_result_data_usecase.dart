import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/cache/cache_manager.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_result_data_usecase.g.dart';

@riverpod
Future<SaveResultDataUseCase> saveResultDataUseCase(Ref ref) async {
  final cacheManager = await ref.watch(cacheManagerProvider.future);
  return SaveResultDataUseCase(cacheManager);
}

class SaveResultDataUseCase {
  final CacheManager cacheManager;

  SaveResultDataUseCase(this.cacheManager);

  Future<void> call(String key, ResultData result) async {
    final jsonString = json.encode(result.toJson());
    await cacheManager.saveResult(key, jsonString);
  }
}
