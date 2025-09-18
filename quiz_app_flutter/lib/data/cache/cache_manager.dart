import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/model/dashboard/dashboard_dto.dart';
import 'package:quiz_app_flutter/data/model/quiz/quiz_list_dto.dart';
import 'package:quiz_app_flutter/di/flutter_riverpod.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cache_manager.g.dart';

@Riverpod(keepAlive: true)
Future<CacheManager> cacheManager(Ref ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return CacheManager(prefs);
}

class CacheManager {
  //static const String _appDataPrefName = "quiz_data_cache";
  static const String _dashboardDataKey = "dashboard_data";

  final SharedPreferences _prefs;

  CacheManager(this._prefs);

  // Dashboard
  Future<void> saveDashboard(DashboardDto dashboard) async {
    final jsonStr = jsonEncode(dashboard.toJson());
    await _prefs.setString(_dashboardDataKey, jsonStr);
  }

  Future<DashboardDto?> getDashboard() async {
    final jsonStr = _prefs.getString(_dashboardDataKey);
    if (jsonStr == null) return null;
    return DashboardDto.fromJson(jsonDecode(jsonStr));
  }

  // QuizSet caching
  Future<void> saveQuiz(String key, QuizListDto quizSet) async {
    final jsonStr = jsonEncode(quizSet.toJson());
    await _prefs.setString(_getQuizKey(key), jsonStr);
  }

  Future<QuizListDto?> getQuiz(String key) async {
    final jsonStr = _prefs.getString(_getQuizKey(key));
    if (jsonStr == null) return null;
    return QuizListDto.fromJson(jsonDecode(jsonStr));
  }

  Future<void> saveResult(String key, String result) async {
    await _prefs.setString(_getQuizResultKey(key), result);
  }

  /// Get quiz result, returns null if not found
  Future<ResultData?> getResult(String key) async {
    final jsonString = _prefs.getString(_getQuizResultKey(key));
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return ResultData.fromJson(jsonMap);
    } else {
      return null;
    }
  }

  String _getQuizResultKey(String key) => 'quiz_result_$key';

  void clear() => _prefs.clear();

  String _getQuizKey(String key) => "quiz_$key";
}
