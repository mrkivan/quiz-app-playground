import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/data/repository/quiz_repository.dart';
import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_dashboard_data_usecase.g.dart';

@riverpod
Future<GetDashboardDataUseCase> getDashboardDataUseCase(Ref ref) async {
  final repository = await ref.watch(quizRepositoryProvider.future);
  return GetDashboardDataUseCase(repository);
}

class GetDashboardDataUseCase {
  final QuizRepository repository;

  GetDashboardDataUseCase(this.repository);

  Future<DashboardData> call() async {
    return repository.getDashboardData();
  }
}
