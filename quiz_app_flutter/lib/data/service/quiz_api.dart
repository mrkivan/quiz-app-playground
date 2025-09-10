import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../di/network_module.dart';
import '../model/dashboard/dashboard_dto.dart';
import '../model/quiz/quiz_list_dto.dart';

class QuizApi {
  final Dio _dio;
  QuizApi(this._dio);

  Future<DashboardDto> getDashboard() async {
    final response = await _dio.get("quiz_sets.json");
    return DashboardDto.fromJson(response.data);
  }

  Future<QuizListDto> getQuizSet(String fileName) async {
    final response = await _dio.get(fileName);
    return QuizListDto.fromJson(response.data);
  }
}

final quizApiProvider = Provider<QuizApi>((ref) {
  final dio = ref.watch(dioProvider);
  return QuizApi(dio);
});
