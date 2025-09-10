import 'dart:async';

import 'package:collection/collection.dart';
import 'package:quiz_app_flutter/domain/mapper/dashboard_mapper.dart';
import 'package:quiz_app_flutter/domain/mapper/quiz_mapper.dart';
import 'package:quiz_app_flutter/domain/mapper/quiz_set_mapper.dart';

import '../../core/resource.dart';
import '../../domain/entities/dashboard/dashboard_data.dart';
import '../../domain/entities/quiz/quiz_data.dart';
import '../../domain/entities/quiz_set/quiz_set_data.dart';
import '../../domain/repository/quiz_repository.dart';
import '../cache/cache_manager.dart';
import '../service/quiz_api.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizApi api;
  final CacheManager cache;

  QuizRepositoryImpl({required this.api, required this.cache});

  @override
  Stream<Resource<DashboardData>> getDashboardData() async* {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final cached = cache.getDashboard();
      if (cached != null) {
        yield Success(cached.toDomain());
        return;
      }
      final remote = await api.getDashboard();
      await cache.saveDashboard(remote);
      yield Success(remote.toDomain());
    } catch (e) {
      yield Failure(Exception(e.toString()));
    }
  }

  @override
  Stream<Resource<QuizSetData>> getQuizListByTopic(String topic) async* {
    final cached = cache.getDashboard();
    if (cached != null) {
      final data = cached.items.firstWhereOrNull((item) => item.topic == topic);

      if (data != null) {
        yield Success(data.toQuizSetDomain());
        return;
      }
    }
    yield Failure(Exception("Data not found"));
  }

  @override
  Stream<Resource<List<QuizData>>> getQuizzesBySetAndTopic(
    String fileName,
  ) async* {
    try {
      final cached = cache.getQuiz(fileName);
      if (cached != null) {
        yield Success(cached.items.map((e) => e.toDomain()).toList());
        return;
      }

      final remote = await api.getQuizSet(fileName);
      await cache.saveQuiz(fileName, remote);
      // Map remote.sections to List<QuizData> if needed
      yield Success(remote.items.map((e) => e.toDomain()).toList());
    } catch (e) {
      yield Failure(Exception(e.toString()));
    }
  }
}
