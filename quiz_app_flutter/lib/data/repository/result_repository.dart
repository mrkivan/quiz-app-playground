import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/cache/cache_manager.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_repository.g.dart';

@riverpod
Future<ResultRepository> resultRepository(Ref ref) async {
  final cacheManager = await ref.watch(cacheManagerProvider.future);
  return ResultRepository(cacheManager);
}

class ResultRepository {
  final CacheManager cache;

  ResultRepository(this.cache);

  Future<void> saveResult(String key, ResultData result) async {
    final jsonString = json.encode(result.toJson());
    await cache.saveResult(key, jsonString);
  }

  Future<ResultData?> getResult(String key) async {
    return cache.getResult(key);
  }
}
