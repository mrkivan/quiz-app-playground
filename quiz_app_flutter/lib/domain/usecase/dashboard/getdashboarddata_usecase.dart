import 'package:quiz_app_flutter/core/resource.dart';
import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';
import 'package:quiz_app_flutter/domain/repository/quiz_repository.dart';

class GetDashboardDataUseCase {
  final QuizRepository repository;

  GetDashboardDataUseCase(this.repository);

  Stream<Resource<DashboardData>> call() {
    return repository.getDashboardData();
  }
}
