// lib/core/cache_manager.dart
import 'dart:convert';

import 'package:quiz_app_flutter/data/model/dashboard/dashboard_dto.dart';
import 'package:quiz_app_flutter/data/model/quiz/quiz_list_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  DashboardDto? getDashboard() {
    final jsonStr = _prefs.getString(_dashboardDataKey);
    if (jsonStr == null) return null;
    return DashboardDto.fromJson(jsonDecode(jsonStr));
  }

  // QuizSet caching
  Future<void> saveQuiz(String key, QuizListDto quizSet) async {
    final jsonStr = jsonEncode(quizSet.toJson());
    await _prefs.setString(_getQuizKey(key), jsonStr);
  }

  QuizListDto? getQuiz(String key) {
    final jsonStr = _prefs.getString(_getQuizKey(key));
    if (jsonStr == null) return null;
    return QuizListDto.fromJson(jsonDecode(jsonStr));
  }

  Future<void> saveResult(String key, String result) async {
    await _prefs.setString(_getQuizResultKey(key), result);
  }

  /// Get quiz result, returns null if not found
  String? getResult(String key) {
    return _prefs.getString(_getQuizResultKey(key));
  }

  String _getQuizResultKey(String key) => 'quiz_result_$key';

  void clear() => _prefs.clear();

  String _getQuizKey(String key) => "quiz_$key";
}
