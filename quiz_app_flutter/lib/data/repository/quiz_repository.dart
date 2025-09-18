import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/cache/cache_manager.dart';
import 'package:quiz_app_flutter/data/service/quiz_api.dart';
import 'package:quiz_app_flutter/di/network_module.dart';
import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';
import 'package:quiz_app_flutter/domain/entities/quiz/quiz_data.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:quiz_app_flutter/domain/mapper/dashboard_mapper.dart';
import 'package:quiz_app_flutter/domain/mapper/quiz_mapper.dart';
import 'package:quiz_app_flutter/domain/mapper/quiz_set_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'quiz_repository.g.dart';

@riverpod
Future<QuizRepository> quizRepository(Ref ref) async {
  final cacheManager = await ref.watch(cacheManagerProvider.future);
  final dio = ref.watch(dioProvider);
  final api = QuizApi(dio);
  return QuizRepository(api, cacheManager);
}

class QuizRepository {
  final QuizApi api;
  final CacheManager cache;

  QuizRepository(this.api, this.cache);

  Future<DashboardData> getDashboardData() async {
    try {
      final cached = await cache.getDashboard();
      if (cached != null) {
        return cached.toDomain();
      }
      final remote = await api.getDashboard();
      await cache.saveDashboard(remote);
      return remote.toDomain();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<QuizSetData> getQuizListByTopic(String topic) async {
    final cached = await cache.getDashboard();
    if (cached != null) {
      final data = cached.items.firstWhereOrNull((item) => item.topic == topic);

      if (data != null) {
        return data.toQuizSetDomain();
      }
    }
    throw Exception("Data not found");
  }

  Future<List<QuizData>> getQuizzesBySetAndTopic(String fileName) async {
    try {
      final cached = await cache.getQuiz(fileName);
      if (cached != null) {
        return cached.items.map((e) => e.toDomain()).toList();
      }

      final remote = await api.getQuizSet(fileName);
      await cache.saveQuiz(fileName, remote);
      // Map remote.sections to List<QuizData> if needed
      return remote.items.map((e) => e.toDomain()).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
